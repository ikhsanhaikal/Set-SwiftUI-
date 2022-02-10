//
//  ContentView.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 06/02/2022.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ViewModel()
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.playingCards, content: { card in
                    Card(shape: viewModel.transform(shape: card.shape, shading: card.shading), color: viewModel.transform(color: card.color), number: viewModel.transform(number: card.number), symbol: card.shape)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            print("Oucch!")
                        }
                })
            }
            Spacer(minLength: 0)
        }
        .padding()
    }
}

struct Card<ShapeView: View>: View {
    var shape: ShapeView
    var color: Color
    var number: Int
    var symbol: ViewModel.SetShape
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(lineWidth: 3)
                .foregroundColor(.gray)
            VStack(spacing: symbol == .squiggle ? -5 : nil) {
                ForEach(0..<number) { _ in
                    shape
                        .scaleEffect(symbol == .squiggle ? 1.2 : 1)
                        .foregroundColor(color)
                }
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
