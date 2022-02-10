//
//  ViewModel.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 09/02/2022.
//

import SwiftUI

class ViewModel:ObservableObject {
    typealias SetModel = Model<SetShape, SetColor, SetNumber, SetShading>
    @Published var model: SetModel
    
    init() {
        self.model = Model(shapes: SetShape.allCases, colors: SetColor.allCases, numbers: SetNumber.allCases, shadings: SetShading.allCases)
    }
    
    var playingCards: [SetModel.Card] {
        model.playingCard
    }
    
    func transform(color: SetColor ) -> Color {
        switch color {
        case .red:
            return Color.pink
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        }
    }
    
    func transform(number: SetNumber ) -> Int {
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
    private func transform<S: Shape>(shape: S, shading: SetShading) -> some View {
        switch shading {
        case .open:
            shape
                .stroke()
        case .striped:
            shape
                .opacity(0.5)
        case .solid:
            shape

        }
    }
    
    @ViewBuilder
    func transform(shape: SetShape, shading: SetShading) -> some View {
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
    
    
    enum SetShape: CaseIterable {
        case diamond
        case oval
        case squiggle
   }
    
    enum SetShading: CaseIterable {
        case open
        case striped
        case solid
    }
    
    enum SetNumber: CaseIterable {
        case one
        case two
        case three
    }
    
    enum SetColor: CaseIterable {
        case red
        case green
        case blue
    }
    
}
