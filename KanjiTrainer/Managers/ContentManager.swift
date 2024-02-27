//
//  ContentManager.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 25/03/23.
//

import Foundation
import Combine

final class ContentManager {
    
    let levels: [Level]
    let currentLevels: CurrentValueSubject<[Level], Error> = .init([])
    
    init() throws {
        levels = try MarugotoFileParser().load()
    }
}
