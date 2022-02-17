//
//  ContentView.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 06/02/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            HStack {
                MyRoundedButton(text: "New Game", action: {
                    viewModel.newGame()
                })
                Spacer()
                HStack(alignment: .top, spacing: 2) {
                    Text("\(viewModel.points)")
                        .font(.largeTitle)
                    Text("pts")
                }
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.playingCards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            Spacer()
            HStack {
                Spacer()
                MyRoundedButton(text: "Draw", action: { viewModel.drawCards() })
                    .disabled(viewModel.cardsOnDeck > 0 ? false : true)
            }
        }
        .padding()
    }
}

struct MyRoundedButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .padding(10)
            .background(content: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.secondary)
                    .opacity(0.2)
            })
            .onTapGesture {
                action()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
