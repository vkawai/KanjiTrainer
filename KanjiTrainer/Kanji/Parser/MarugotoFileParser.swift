import Foundation

struct MarugotoFileParser {
    
    enum OperationError: Error {
        case fileNotFound
    }
    
    init() {}
    
    func load() throws -> [Level] {
        try parseLevels(from: kanjiFileContent())
    }
}

// MARK: File reader
extension MarugotoFileParser {
    
    private func kanjiFileContent() throws -> String {
        guard let url = Bundle.main.url(forResource: "kanjis", withExtension: "txt") else { throw OperationError.fileNotFound }
        return try String(contentsOf: url)
    }
}

// MARK: Parsers
extension MarugotoFileParser {
    
    private func parseEntries(from contentSubstring: Substring) throws -> [Kanji] {
        let entryRegex = #/^\d+ .+ \d+$/#.anchorsMatchLineEndings()
        let dataRegex = #/^(\d+) (.+) (.+) \d+$/#.anchorsMatchLineEndings()
        
        return contentSubstring.ranges(of: entryRegex).compactMap {
            guard let match = try? dataRegex.wholeMatch(in: contentSubstring[$0]) else {
                return nil
            }
            return Kanji(
                id: Int(match.output.1) ?? -1,
                word: String(match.output.2).replacingOccurrences(of: "~", with: ""),
                reading: String(match.output.3)
            )
        }
    }
    
    private func parseTopics(from contentSubstring: Substring) throws -> [Topic] {
        let topicRegex = #/トピック (\d+) (.+)/#
        let ranges = contentSubstring.ranges(of: topicRegex)
        var topics: [Topic] = []
        for entry in ranges.enumerated() {
            let (offset, range) = entry
            let topicRanges = range.lowerBound..<(offset < ranges.count-1 ? ranges[offset+1].lowerBound : contentSubstring.endIndex)
            if let match = contentSubstring[range].firstMatch(of: topicRegex) {
                let kanjis = try parseEntries(from: contentSubstring[topicRanges])
                topics.append(Topic(
                    id: Int(match.output.1) ?? -1,
                    name: String(match.output.2),
                    kanjis: kanjis
                ))
            }
        }
        
        return topics
    }
    
    private func parseLevels(from content: String) throws -> [Level] {
        let levelStrings = [
            "入門（にゅうもん）",
            "初級（しょきゅう）1",
            "初級（しょきゅう）2"
        ]
        
        var levels: [Level] = []
        
        for index in 0..<levelStrings.count {
            let regex = try Regex("(\(levelStrings[index]))((?:\n.*)+)\(index+1 < levelStrings.count ? levelStrings[index+1] : "")")
            let ranges = content.ranges(of: regex)
            
            let topics = try ranges.flatMap { range in try parseTopics(from: content[range]) }
            levels.append(.init(id: index, name: levelStrings[index], topics: topics))
        }
        
        return levels
    }
}
