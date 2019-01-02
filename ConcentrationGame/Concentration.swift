//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Oleksii Cherevatyi on 11/16/18.
//  Copyright © 2018 Oleksii Cherevatyi. All rights reserved.
//

import Foundation

class Concentration {
    
    // var cards = Array<Card>()
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
                
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                 cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // this is the final version
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    // nice progressing examples of benefiting the fact, that Card is a struct and gets duplicated each time
    //    init_basic4(numberOfPairsOfCards: Int) {
    //        for identifier in 0...numberOfPairsOfCards {
    //            let card = Card(indetifier: indentifier)
    //            cards.append(card)
    //            cards.append(card)
    //        }
    //    }
    
    //    init_basic3(numberOfPairsOfCards: Int) {
    //        for identifier in 0...numberOfPairsOfCards {
    //            let card = Card(indetifier: indentifier)
    //            let matchingCard = Card(identifier: identifier)
    //            cards.append(card)
    //            cards.append(matchingCard)
    //        }
    //    }
    
    //    init_basic2(numberOfPairsOfCards: Int) {
    //        for identifier in 0...numberOfPairsOfCards {
    //            let card = Card(indetifier: indentifier)
    //            let matchingCard = card // creates a copy of card here, because Card is a struct!
    //        }
    //    }
    
    //    init_basic(numberOfPairsOfCards: Int) {
    //        for identifier in 1...numberOfPairsOfCards {
    //            let card = Card(indetifier: indentifier)
    //            let matchingCard = Card(identifier: identifier)
    //        }
    //    }
    
}
