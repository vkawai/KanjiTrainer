//
//  KanjiViewModel.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 07/04/23.
//

import Foundation
import Combine
import SwiftUI

struct KanjiViewModel {
    
    let kanji: Kanji
    let wordDefinitionDictionary: KanjiDictionary = Jisho()
    let kanjiDefitionDictionary: KanjiDictionary = BokuraJisho()
    
    var showingWordOnJisho: Bool = false
    var showingKanjiOnJisho: Bool = false
        
    func jishoURL(for: Kanji, kanjiDefition: Bool) -> URL? {
        let cleanedKanji = kanji.word.replacingOccurrences(of: "～", with: "")
            .replacing(#/（.+）/#, with: "")
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        if kanjiDefition {
            return kanjiDefitionDictionary.kanjiDefinitionURL(for: cleanedKanji)
        } else {
            return wordDefinitionDictionary.wordDefinitionURL(for: cleanedKanji)
        }
    }
}
