//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Ralph on 29/10/2018.
//  Copyright © 2018 B1SA. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    
    init(numberOfPairsOfCards: Int){
        
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = nil;
            } else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceup = false
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
        print("Fim do jogo?")
        
        
        
    }
}
