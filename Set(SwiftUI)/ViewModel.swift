//
//  ViewModel.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 09/02/2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    typealias SetModel = Model<SetShape, SetColor, SetNumber, SetShading>
    @Published var model: SetModel
    
    init() {
        self.model = Model(shapes: SetShape.allCases, colors: SetColor.allCases, numbers: SetNumber.allCases, shadings: SetShading.allCases)
    }
    
    var playingCards: [SetModel.Card] {
        model.playingCard
    }
    
    func choose(_ card: SetModel.Card) {
        model.choose(card)
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
