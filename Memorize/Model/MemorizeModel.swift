//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/10/25.
//

import Foundation

struct CardGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card] = []
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex + 1)a", content: content))
            cards.append(Card(id: "\(pairIndex + 1)b", content: content))
        }
    }
    var indexofTheOneAndOnlyFaceUpCard: Int? {
        get{
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set{
            cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) }
            
        }
    }
    
    
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexofTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        //                    score += 1
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {

                    indexofTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                cards[chosenIndex].isFaceUp = true
            }
        }
        
    }
    
    
    mutating func shuffle() {
        cards.shuffle()
    }
    var score = 0
    
    struct Card: Equatable, Identifiable {
        
        
        var id: String
        let content: CardContent
        var isFaceUp = true
        var isMatched = false
    }
    
}
