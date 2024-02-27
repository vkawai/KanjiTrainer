import Foundation

protocol KanjiDictionary {
    var serviceName: String { get }
    func wordDefinitionURL(for kanji: String) -> URL?
    func kanjiDefinitionURL(for kanji: String) -> URL?
}

struct Jisho: KanjiDictionary {

    let serviceName = "Jisho"
    
    private let baseSearchURLString: String = "https://jisho.org/search/"

    init() {}

    func wordDefinitionURL(for kanji: String) -> URL? {
        URL(string: baseSearchURLString + kanji + "#words")
    }
    
    func kanjiDefinitionURL(for kanji: String) -> URL? {
        URL(string: baseSearchURLString + kanji + "#kanji")
    }
}

struct BokuraJisho: KanjiDictionary {

    let serviceName = "BokuraJisho"
    
    private let baseSearchURLString: String = "https://bokurajisho.com/search?keyword="

    init() {}

    func wordDefinitionURL(for kanji: String) -> URL? {
        URL(string: baseSearchURLString + kanji + "&tl=en")
    }
    
    func kanjiDefinitionURL(for kanji: String) -> URL? {
        URL(string: baseSearchURLString + kanji + "&t=k&tl=en")
    }
}
