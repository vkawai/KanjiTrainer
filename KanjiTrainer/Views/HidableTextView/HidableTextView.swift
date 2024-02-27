//
//  HidableTextView.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 25/03/23.
//

import SwiftUI

struct HidableTextView: View {
    
    @State var viewModel: HidableTextViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button {
            viewModel.isContentHidden.toggle()
        } label: {
            Text(viewModel.isContentHidden ? viewModel.hiddenText : viewModel.text)
                .font(.system(size: 26))
                .foregroundStyle(Color(viewModel.isContentHidden ? .unselectedTexTip : .selectedTextTip))
                .fontWeight(viewModel.isContentHidden ? .regular : .bold)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
        .background(Color(.background))
        .cornerRadius(8)
        .padding()
    }
    
    func toggle() {
        viewModel.isContentHidden.toggle()
    }
}

struct HidableTextView_Previews: PreviewProvider {
    static var previews: some View {
        HidableTextView(viewModel: .init(text: "content", isContentHidden: true))
    }
}
