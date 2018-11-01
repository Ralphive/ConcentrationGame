//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Ralph on 29/10/2018.
//  Copyright © 2018 B1SA. All rights reserved.
//

import Foundation

struct Concentration{
    private(set) var cards = [Card]()
    
    init(numberOfPairsOfCards: Int){
        
        assert(numberOfPairsOfCards > 0, "Concentration.init at: \(numberOfPairsOfCards):you must have at least one pair of cards")
        
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceup{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceup = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        
        assert(cards.indices.contains(index), "Concentration.choseCard at: \(index): not in the cards")
        
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
            } else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceup = false
                }
                cards[index].isFaceup = true
            }
            
        }
        print("Fim do jogo?")
    }
}
