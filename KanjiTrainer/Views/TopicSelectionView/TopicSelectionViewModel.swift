//
//  TopicSelectionViewModel.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 07/04/23.
//

import Foundation

struct TopicSelectionViewModel {
    
    let levels: [Level]
    var selectedItems: Set<Topic> = []
    
    mutating func selectAll() {
        selectedItems = Set(levels.flatMap { level in level.topics })
    }
    
    mutating func selectAllTopics(from level: Level) {
        selectedItems.formUnion(level.topics)
    }
    
    mutating func select(topic: Topic) {
        selectedItems.insert(topic)
    }
    
    mutating func remove(topic: Topic) {
        selectedItems.remove(topic)
    }
}
