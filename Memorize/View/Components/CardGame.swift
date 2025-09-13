//
//  CardGame.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/10/25.
//

import SwiftUI

struct CardGame: View {
    
    let card: CardGameModel<String>.Card
    
    init(_ card: CardGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                base.foregroundStyle(Color.white)
                base.strokeBorder(Color.orange)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
            }.opacity(card.isFaceUp ? 0 : 1)
            
            base
                .opacity(card.isFaceUp ? 1 : 0)
            
            
        }
    }
}

//#Preview {
//    CardGame(card: <#T##CardGameModel<String>.Card#>)
//}
