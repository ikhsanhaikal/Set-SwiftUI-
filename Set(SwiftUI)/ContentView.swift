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
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.playingCards, content: { card in
                    Card(shape: transform(shape: card.shape, shading: card.shading), color: transform(color: card.color), number: transform(number: card.number), symbol: card.shape)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                })
            }
            Spacer(minLength: 0)
        }
        .padding()
    }
    
    func transform(color: ViewModel.SetColor ) -> Color {
        switch color {
        case .red:
            return Color.pink
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        }
    }
    
    func transform(number: ViewModel.SetNumber ) -> Int {
        switch number {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        }
    }
    
    @ViewBuilder
    private func transform<S: Shape>(shape: S, shading: ViewModel.SetShading) -> some View {
        switch shading {
        case .open:
            shape
                .stroke()
        case .striped:
            shape
                .striped()
        case .solid:
            shape

        }
    }
    
    @ViewBuilder
    func transform(shape: ViewModel.SetShape, shading: ViewModel.SetShading) -> some View {
        switch shape {
        case .oval:
            transform(shape: Capsule(), shading: shading)
                .aspectRatio(3/1.5, contentMode: .fit)
        case .squiggle:
            transform(shape: Squiggle(), shading: shading)
                .aspectRatio(3/2.7, contentMode: .fit)
        case .diamond:
            transform(shape: Diamond(), shading: shading)
                .aspectRatio(3/1.5, contentMode: .fit)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
