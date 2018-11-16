//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Oleksii Cherevatyi on 11/14/18.
//  Copyright © 2018 Oleksii Cherevatyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    // didSet {} - no, lazy vars can't have didSet methods
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    // @IBOutlet var cardButons: Array<UIButton>! alternative syntax
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
        
        
    }
    
    func updateViewFromModel() {
        //        for index in 0..cardButtons.count {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    
    var emojiChoices = ["🦊", "☂️", "🍎", "💩", "👀", "🐤", "🐝", "🐬", "🌼"]
    
    var emoji = [Int: String]()
    // var emoji = Dictionary<Int, String>()
    
    
    func emoji(for card: Card) -> String {
        //  if emoji[card.identifier] ==  nil {
        //     if emojiChoices.count > 0 {
        if emoji[card.identifier] ==  nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex) // remove returns the removed element before removing it
        }
        return emoji[card.identifier] ?? "?"
    }
    
    // new syntax
    //        func emoji(for card: Card) -> String {
    //            return emoji[card.identifier] ?? "?"
    //            // isn't that COOL!!!??? It is exactly same as emoji2() func.
    //            // It means return emoji from dict by card id or if not present in dict, return ?
    //        }
    
    // good old syntax
    //    func emoji2(for card: Card) -> String {
    //        if emoji[card.identifier] != nil {
    //            return emoji[card.identifier]!
    //        } else {
    //            return "?"
    //        }
    //    }
    
}

