//
//  KanjiView.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 25/03/23.
//

import SwiftUI

struct KanjiView: View {
    
    @State var viewModel: KanjiViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            VStack {
                Text(viewModel.kanji.word)
                    .font(.system(size: 80))
                    .foregroundStyle(Color(.text))
                    .padding(.top)
                    .padding(.bottom, 8)
                    .padding([.leading, .trailing], 16)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                
                HidableTextView(viewModel: .init(text: viewModel.kanji.reading, isContentHidden: true))
                    .padding(.bottom, 0)
                
                HStack {
                    Spacer()
                    Button {
                        viewModel.showingWordOnJisho = true
                    } label: {
                        Text("Definition")
                    }.padding(18)
                        .sheet(isPresented: $viewModel.showingWordOnJisho) {
                            let kanji = viewModel.kanji
                            let url = viewModel
                                .jishoURL(for: kanji, kanjiDefition: false)!
                            SafariView(viewModel: .init(url: url))
                        }
                    Spacer()
                    Button {
                        viewModel.showingKanjiOnJisho = true
                    } label: {
                        Text("Kanjis")
                    }.padding(18)
                        .sheet(isPresented: $viewModel.showingKanjiOnJisho) {
                            let url = viewModel
                                .jishoURL(for: viewModel.kanji, kanjiDefition: true)!
                            SafariView(viewModel: .init(url: url))
                        }
                    Spacer()
                }
            }
        }.frame(maxHeight: .infinity)
            .background(Color(.background))
    }
}

struct KanjiView_Previews: PreviewProvider {
    static var previews: some View {
        KanjiView(
            viewModel: .init(kanji: .init(id: 0, word: "肉", reading: "にく"))
        )
    }
}
