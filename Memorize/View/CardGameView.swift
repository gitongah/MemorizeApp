//
//  ContentView.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/9/25.
//

import SwiftUI

struct CardGameView: View {
    @ObservedObject var viewModel: MemorizeViewModel
    
    let columns =  [GridItem(.adaptive(minimum: 85),spacing: 0)]
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            Spacer()
            card
            
            Spacer()
            
            themeBar
            
        }
        .padding()
        
    }
    var card: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0){
                ForEach(viewModel.cards.indices, id: \.self) { index in
                    CardGame(viewModel.cards[index])
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                    
                }
            }
            .foregroundStyle(.orange)
            
        }
        
    }
    private var themeBar: some View {


        return HStack {
            VStack {
                Button("Shuffle"){
                    viewModel.shuffle()
                }
            }
            Button(action: {
                
            } , label: {
                HStack {
                    Image(systemName: "theatermasks.fill")
                    Text("Halloween")
                }
                
                
            })
            
            Button(action: {
                
            } , label: {
                HStack {
                    Image(systemName: "pawprint.fill")
                    Text("animals")
                }
                
                
            })
            
            Button(action: {
                
                
            }, label: {
                HStack {
                    Image(systemName: "fork.knife.circle.fill")
                    Text("Food")
                }
            })
            
            
        }
        .buttonStyle(.borderedProminent)
    }
    
    
}

#Preview {
    CardGameView(viewModel:MemorizeViewModel() )
    
}




