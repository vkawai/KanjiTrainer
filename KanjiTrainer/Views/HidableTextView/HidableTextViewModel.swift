//
//  HidableTextViewModel.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 07/04/23.
//

import Foundation
import SwiftUI

struct HidableTextViewModel {
    
    let text: String
    let hiddenText: String = "Tap to reveal reading"
    var isContentHidden: Bool
}
