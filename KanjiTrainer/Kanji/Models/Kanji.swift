import Foundation

public struct Kanji: Identifiable, Equatable, Hashable, Codable {
    
    public let id: Int
    public let word: String
    public let reading: String
    
    public init(id: Int, word: String, reading: String) {
        self.id = id
        self.word = word
        self.reading = reading
    }
}
