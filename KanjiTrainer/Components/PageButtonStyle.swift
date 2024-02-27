//
//  PageButtonStyle.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 26/03/23.
//

import SwiftUI

struct PageButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        let grayColorValues = isEnabled ?
            (configuration.isPressed ? 0.5 : 0.2) :
            0.8
        
        configuration.label
            .padding()
            .frame(maxHeight: .infinity)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(Color(
                red: grayColorValues,
                green: grayColorValues,
                blue: grayColorValues
            ))
    }
}
