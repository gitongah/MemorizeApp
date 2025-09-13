//
//  MemorizeViewModel.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/10/25.
//

import SwiftUI



class MemorizeViewModel: ObservableObject {
    private static let emojis = ["👻","🕷️","🎃","💀","👹","🧟‍♂️"]
    
    private static func createMmemoryGame() -> CardGameModel<String>{
        return CardGameModel(numberOfPairsOfCards: 4){ index in
            if emojis.indices.contains(index) {
                return MemorizeViewModel.emojis[index]
            }else {
                return "⁉️"
            }
        }
    }

    
    @Published private var game = createMmemoryGame()
    
    var cards: [CardGameModel<String>.Card] {
        return game.cards
    }
     func shuffle() {
        game.shuffle()
    }
    func choose(_ card: CardGameModel<String>.Card) {
        game.choose(card)
    }
    
}
