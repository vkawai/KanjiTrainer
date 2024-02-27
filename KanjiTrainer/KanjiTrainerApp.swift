//
//  KanjiTrainerApp.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 25/03/23.
//

import SwiftUI

@main
struct KanjiTrainerApp: App {
    
    let contentManager = try! ContentManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ZStack {
                    let levels = contentManager.levels
                    TopicSelectionView(viewModel: .init(levels: levels))
                }.background()
            }
        }
    }
}
