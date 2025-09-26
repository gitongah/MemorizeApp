//
//  ContentView.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/9/25.
//

import SwiftUI

struct CardGameView: View {
    @ObservedObject var viewModel: MemorizeViewModel
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            Spacer()
            card
                .foregroundStyle(viewModel.color)
                .animation(.default, value: viewModel.cards)
            
            Spacer()
            themeBar
            
            
        }
        .padding()
        
    }
    var card: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(count: viewModel.cards.count, size: geometry.size, aspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize),spacing: 0)], spacing: 0){
                ForEach(viewModel.cards) { card in
                    CardGame(card)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    
                }
            }
                        
        }
        
    }
    private var themeBar: some View {
        HStack {
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        
    }
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        aspectRatio: CGFloat)
    -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            
            if height * rowCount <= size.height {
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
            
        }while columnCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
    
    
}

#Preview {
    CardGameView(viewModel:MemorizeViewModel() )
    
}




