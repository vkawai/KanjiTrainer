//
//  QuizView.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 31/03/23.
//

import SwiftUI

struct QuizView: View {
    
    @State var viewModel: QuizViewModel
    
    var body: some View {
        ZStack {
            TabView {
                ForEach(Array(viewModel.kanjis.enumerated()), id: \.offset) {  offset, kanji in
                    VStack {
                        KanjiView(viewModel: .init(kanji: kanji))
                        Text("\(offset + 1)/\(viewModel.kanjis.count)")
                            .offset(y: -50)
                    }
                }
            }.tabViewStyle(PageTabViewStyle())
        }.navigationTitle("QUIZ")
            .background(Color(.background))
    }
}

struct PagedQuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(
            viewModel: .init(kanjis: [
                .init(id: 0, word: "肉", reading: "にく"),
                .init(id: 0, word: "魚", reading: "さかな"),
                .init(id: 0, word: "卵", reading: "たまご")
            ])
        )
    }
}
