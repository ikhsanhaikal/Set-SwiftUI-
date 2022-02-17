//
//  Card.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 11/02/2022.
//

import SwiftUI

struct CardView: View {
    var card : ViewModel.SetModel.Card
    var body: some View {
        let shape   = transform(shape: card.shape, shading: card.shading)
        let color   = transform(color: card.color)
        let number  = transform(number: card.number)
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor( card.state == .selected ? Color("lightYellow") : .white)
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(lineWidth: 3)
                .foregroundColor(card.state == .notmatched ? Color.red : card.state == .matched ? Color.blue : .gray)
            VStack(spacing: card.shape == .squiggle ? -5 : nil) {
                ForEach(0..<number, id: \.self) { i in
                    shape
                        .scaleEffect(card.shape == .squiggle ? 1.2 : 1)
                        .foregroundColor(color)
                }
            }
            .padding()
        }
    }
    
    func transform(color: ViewModel.SetColor ) -> Color {
        switch color {
        case .red:
            return Color("pink")
        case .blue:
            return Color("blue")
        case .green:
            return Color("green")
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

//struct Card_Previews: PreviewProvider {
//    static var previews: some View {
//        let vm = ViewModel()
//        Card(card: vm.playingCards.first!)
//    }
//}
