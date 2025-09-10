//
//  ContentView.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojiArray = ["👻", "🕷️", "🎃", "👻", "🕷️", "🎃"]
        HStack{
            ForEach(emojiArray.indices, id: \.self) { emoji in
                CardView(content: emojiArray[emoji])
            }
        }
            .padding()
            .foregroundStyle(Color.orange)

    }
}

#Preview {
    ContentView()

}


struct CardView: View {
    @State var isFlipped = true
    let content: String
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFlipped {
                base.foregroundStyle(Color.white)
                base.strokeBorder(Color.orange)
                Text(content)
                    .font(.largeTitle)
                
            }else {
                base
            }
        }.onTapGesture {
            isFlipped.toggle()
            
        }
    }
}

