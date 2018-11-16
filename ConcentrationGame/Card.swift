//
//  Card.swift
//  ConcentrationGame
//
//  Created by Oleksii Cherevatyi on 11/16/18.
//  Copyright © 2018 Oleksii Cherevatyi. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    // !Attention - no field emoji here!!! Because this Card struct is a Model part, not a view! emoji is related to view, not to model
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
