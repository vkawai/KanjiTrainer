import Foundation

struct Topic: Identifiable, Equatable, Hashable, Codable {
    
    let id: Int
    let name: String
    let kanjis: [Kanji]
    
    init(id: Int, name: String, kanjis: [Kanji]) {
        self.id = id
        self.name = name
        self.kanjis = kanjis
    }
}
