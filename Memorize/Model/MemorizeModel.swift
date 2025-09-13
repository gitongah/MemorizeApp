//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/10/25.
//

import Foundation

enum GameTheme{
    case spooky
    case animals
    case food
    
    var uniques: [String]{
        switch self {
        case .spooky:
            return Theme.spooky
        case .animals:
            return Theme.animals
        case .food:
            return Theme.food
        }
    }
}
struct Theme{
    
    //Spooky 👻
    static let spookyUnique = ["👻","🕷️","🎃","💀","👹","🧟‍♂️"]
    static let spooky: [String] = (spookyUnique + spookyUnique).shuffled()
    // Animals 🐶
    static let animalUnique = ["🐶","🐱","🦁","🐼","🐸","🦊"]
    static let animals: [String] = (animalUnique + animalUnique).shuffled()
    
    // Food 🍎
    static let foodUnique = ["🍎","🍔","🍕","🍩","🍫","🍦"]
    static let food: [String] = (foodUnique + foodUnique).shuffled()
    
}
struct CardGameModel<CardContent> {
    
    private(set) var cards: [Card] = []
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    mutating func shuffle() {
        cards.shuffle()
    }
    var score = 0
    
    struct Card {
//        var id: Int
        let content: CardContent
        var isFaceUp = false
        var isMatched = false
    }
    
}
