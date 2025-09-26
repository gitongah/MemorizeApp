//
//  CardGame.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/10/25.
//

import SwiftUI

struct CardGame: View {
    
    typealias Card = CardGameModel<String>.Card
    let card: Card
    
    init(_ card: CardGameModel<String>.Card) {
        self.card = card
    }
    

    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("cards")
            .accessibilityValue(card.isFaceUp ? "face up" : "face down")
            .accessibilityIdentifier("cards")
        
    }
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 3
        static let inset: CGFloat = 4
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        struct Pie {
            static let inset: CGFloat = 4
            static let opacity: Double = 0.3
        }
    }
        
}

#Preview {
    CardGame(CardGameModel<String>.Card( id: "test1", content: "🙈", isFaceUp: true, isMatched: false))
}

