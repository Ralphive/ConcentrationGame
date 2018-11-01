//
//  Card.swift
//  ConcentrationGame
//
//  Created by Ralph on 29/10/2018.
//  Copyright © 2018 B1SA. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var isFaceup = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    var hashValue: Int {return identifier}
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    static func ==(lhs:Card, rhs: Card) -> Bool{
        return lhs.identifier == rhs.identifier
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

}
