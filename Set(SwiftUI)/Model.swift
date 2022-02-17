//
//  Model.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 07/02/2022.
//

import Foundation
import SwiftUI

struct Model<SetShape, SetColor, SetNumber, SetShading> where SetShape: Equatable, SetColor: Equatable, SetNumber: Equatable, SetShading: Equatable {
    
    var deck: [Card]
    
    var playingCard: [Card] = []
    
    private var chosenCards: [Int] = []
    private var wasMatching = false
    var points = 0
    
    init(shapes: Array<SetShape>, colors: Array<SetColor>, numbers: Array<SetNumber>, shadings: Array<SetShading> ) {
        deck = []
        for shape in shapes {
            for color in colors {
                for number in numbers {
                    for shading in shadings {
                        let card = Card(shape: shape, color: color, number: number, shading: shading)
                        deck.append(card)
                    }
                }
            }
        }
        deck.shuffle()
        playingCard = deck.getAndRemove(first: 12)
    }
    
    private func check<SetContent: Equatable>(x: SetContent, y: SetContent, z: SetContent) -> Bool {
        if x == y {
            if y == z {
                return true
            }
            return false
        } else {
            if y == z {
                return false
            }
            return !(x == z)
        }
    }
    
    private func check(suspect: Array<Int>) -> Bool {
        let x = playingCard[suspect[0]]
        let y = playingCard[suspect[1]]
        let z = playingCard[suspect[2]]
        
        if check(x: x.shape, y: y.shape, z: z.shape) {
            if check(x: x.number, y: y.number, z: z.number) {
                if check(x: x.shading, y: y.shading, z: z.shading) {
                    if check(x: x.color, y: y.color, z: z.color) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    mutating func choose(_ card: Card) {
        if let indexOfChosenCard = playingCard.firstIndex(where: {$0.id == card.id}),
           playingCard[indexOfChosenCard].state != .matched {
            if wasMatching {
                if playingCard[chosenCards.first!].state == .notmatched {
                    chosenCards.forEach {
                        if playingCard[$0].state == .notmatched {
                            playingCard[$0].state = .normal
                        }
                    }
                } else {
                    chosenCards.forEach({ playingCard[$0] = deck.removeFirst() })
                    points += 3
                }
                chosenCards.removeSubrange(..<3)
                wasMatching = false
            }
            if let index = chosenCards.firstIndex(of: indexOfChosenCard) {
                chosenCards.remove(at: index)
                playingCard[indexOfChosenCard].state = .normal
            } else {
                playingCard[indexOfChosenCard].state = .selected
                chosenCards.append(indexOfChosenCard)
                if chosenCards.count == 3 {
                    if check(suspect: chosenCards) {
                        chosenCards.forEach { playingCard[$0].state = .matched}
                    } else {
                        chosenCards.forEach { playingCard[$0].state = .notmatched}
                    }
                    wasMatching = true
                }
            }
        }
    }
        
    struct Card: Identifiable {

        let shape  : SetShape
        let color  : SetColor
        let number : SetNumber
        let shading: SetShading
        var state  : CardState = .normal
        let id = UUID()
        
        enum CardState {
            case selected
            case matched
            case notmatched
            case normal
        }
    }
}

extension Array {
    mutating func getAndRemove(first: Int) -> [Element]{
        let newArray = self[..<first].map({ $0 })
        self.removeFirst(first)
        return Array(newArray)
    }
}
