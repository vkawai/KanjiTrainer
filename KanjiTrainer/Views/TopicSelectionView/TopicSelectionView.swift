//
//  TopicSelectionView.swift
//  KanjiTrainer
//
//  Created by Vitor Kawai Sala on 31/03/23.
//

import SwiftUI

struct TopicSelectionView: View {
    
    @State var viewModel: TopicSelectionViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button("Select All") {
                        viewModel.selectAll()
                    }.padding(.trailing)
                }
                levelList
                NavigationLink {
                    let kanjis = kanjisFromSelectedTopics()
                    QuizView(viewModel: .init(kanjis: kanjis))
                } label: {
                    Text("Começar")
                }.frame(maxWidth: .infinity)
                    .padding()
                    .disabled(viewModel.selectedItems.isEmpty)
                
            }
        }.navigationTitle("Select Topics")
    }
    
    var levelList: some View {
        List {
            ForEach(viewModel.levels) { level in
                Section  {
                    sectionContent(for: level)
                } header: {
                    HStack {
                        Text(level.name)
                        Spacer()
                        Button("All") {
                            viewModel.selectAllTopics(from: level)
                        }.buttonStyle(PlainButtonStyle())
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                            .padding(.trailing)
                    }
                }
                
            }
        }.listStyle(SidebarListStyle())
    }
    
    private func sectionContent(for level: Level) -> some View {
        ForEach(level.topics) { topic in
            Button {
                if viewModel.selectedItems.contains(topic) {
                    viewModel.selectedItems.remove(topic)
                } else {
                    viewModel.selectedItems.insert(topic)
                }
            } label: {
                HStack {
                    Text("トピック \(topic.id): \(topic.name)")
                    Spacer()
                    if viewModel.selectedItems.contains(topic) {
                        Image(systemName: "checkmark.circle")
                    }
                }
            }
        }
    }
    
    private func kanjisFromSelectedTopics() -> [Kanji] {
        viewModel.selectedItems
            .flatMap { $0.kanjis }
            .shuffled()
    }
}

struct TopicSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TopicSelectionView(viewModel: .init(levels: [
            .init(id: 0, name: "QWE", topics: [
                .init(id: 0, name: "QWE", kanjis: []),
                .init(id: 1, name: "ASD", kanjis: [])
            ]),
            .init(id: 1, name: "ASD", topics: [
                .init(id: 0, name: "QWE", kanjis: []),
                .init(id: 1, name: "ASD", kanjis: [])
            ])
        ]))
    }
}
