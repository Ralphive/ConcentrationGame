//
//  Card.swift
//  ConcentrationGame
//
//  Created by Ralph on 29/10/2018.
//  Copyright © 2018 B1SA. All rights reserved.
//

import Foundation

struct Card {
    var isFaceup = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

}
