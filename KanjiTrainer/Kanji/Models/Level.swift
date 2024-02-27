import Foundation

struct Level: Identifiable, Equatable, Hashable, Codable {
    
    let id: Int
    let name: String
    let topics: [Topic]
    
    init(id: Int, name: String, topics: [Topic]) {
        self.id = id
        self.name = name
        self.topics = topics
    }
}
