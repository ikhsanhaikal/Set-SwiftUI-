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
    var currentlyChosenCards: [Int] = []
    var wasSet: Bool?
    
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
        if let chosenCard = playingCard.firstIndex(where: {$0.id == card.id}) {
            if currentlyChosenCards.contains(chosenCard) {
                currentlyChosenCards.removeAll(where: {$0 == chosenCard})
                return
            }
            currentlyChosenCards.append(chosenCard)
            print(currentlyChosenCards)
            if currentlyChosenCards.count == 3 {
                wasSet = check(suspect: currentlyChosenCards)
                print("is set: \(String(wasSet!))")
            } else if currentlyChosenCards.count > 3 {
                if let result = wasSet, result {
                    currentlyChosenCards.forEach {
                        playingCard[$0] = decks.removeFirst()
                    }
                }
                currentlyChosenCards.removeFirst(3)
                wasSet = nil
            }
        }
    }
        
    
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
