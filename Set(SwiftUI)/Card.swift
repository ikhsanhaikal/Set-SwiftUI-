//
//  Card.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 11/02/2022.
//

import SwiftUI

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

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(
            shape: Squiggle()
                .aspectRatio(3/2.5, contentMode: .fit),
            color: Color.red, number: 3, symbol: .squiggle)
    }
}
