//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Ralph on 29/10/2018.
//  Copyright © 2018 B1SA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards: Int{
        return cardButtons.count/2
    }
    
    private var emoji =  Dictionary<Card,String>()
    private var emojiThemes  = [["🎃","👻","👹","🙀","😱","🦇"],
                        ["🦄","🦑","🐰","🐷","🐸","🐮"],
                        ["🚜","🚘","🚑","🚒","🚃","🛵"],
                        ["⚓️","🚢","⛵️","🚤","🛶","⛴"],
                        ["🌎","🌞","☄️","⭐️","🌙","🌑"],
                        ["⚽️","🏀","🎾","🥇","🎱","🏈"]]
    lazy var emojiChoice = emojiThemes[Int.random(in: 0..<emojiThemes.count)]
    
    private var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("cardNumber touched is \(cardNumber)")
        }else{
            print("Choosen card isnt into the cardButtons")
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        initiGame()
    }
    
    
    func initiGame(){
        game = Concentration(numberOfPairsOfCards: cardButtons.count/2)
        flipCount = 0
        emojiChoice = emojiThemes[Int.random(in: 0..<emojiThemes.count)]
        updateViewFromModel()
    }
    
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceup{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
            }else{
                button.setTitle("", for: UIControl.State.normal)
            }
            button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 1, blue: 0.8032929301, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            button.isEnabled = card.isMatched ? false : true

        }
    }


    private func emoji(for card: Card) -> String {
        if emoji[card] == nil{
            if emojiChoice.count > 0 {
                emoji[card] = emojiChoice.remove(at: emojiChoice.count.arc4random)
            }
        }
        
        if emoji[card] != nil {
            return emoji[card]!
        }else{
            return "?"
        }
        //or return emoji[card.identifier] ?? "?"
        
    }
    
    private func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard withEmoji: \(emoji)")
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
