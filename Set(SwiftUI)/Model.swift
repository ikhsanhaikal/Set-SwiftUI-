//
//  Model.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 07/02/2022.
//

import Foundation
import SwiftUI

struct Model<SetShape, SetColor, SetNumber, SetShading> where SetShape: Equatable, SetColor: Equatable, SetNumber: Equatable, SetShading: Equatable {
    
    var decks: [Card]
    
    var playingCard: [Card] = []
    
    init(shapes: Array<SetShape>, colors: Array<SetColor>, numbers: Array<SetNumber>, shadings: Array<SetShading> ) {
        decks = []
        for shape in shapes {
            for color in colors {
                for number in numbers {
                    for shading in shadings {
                        let card = Card(shape: shape, color: color, number: number, shading: shading)
                        decks.append(card)
                    }
                }
            }
        }
        decks.shuffle()
        playingCard = decks.getAndRemove(first: 12)
    }
    
//    func choose(card: Card) {
//        if let chosenCard = playingCard.firstIndex(where: {$0 == card}) {
//            set cards[chosenCard] status to true or false
//            if chosenCard count == 3 {
//                do some calculation if it match record it
//                                    else record it also
//            } else if chosenCard count > 3 {
//                based on record
//                if it was match remove from playing card
//                else unselected those 3 card
//            }
//                        
//        }
//    }
//    
    
    
    struct Card: Identifiable {
        var id = UUID()
        var shape  : SetShape
        var color  : SetColor
        var number : SetNumber
        var shading: SetShading
    }
}

extension Array {
    mutating func getAndRemove(first: Int) -> [Element]{
        let newArray = self[..<12].map({ $0 })
        self.removeFirst(12)
        return Array(newArray)
    }
}
