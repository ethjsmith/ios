//
//  ContentView.swift
//  memrize
//
//  Created by Ethan Smith on 1/12/22.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = EmojiMemoryGame()
    
    var body: some View {
        VStack{
            LazyVGrid(columns:[GridItem(.adaptive(minimum:65))]){

                ForEach(viewModel.cards) { card in
                    cardView(card: card).aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture{
                            viewModel.choose(card)
                        }
            }

        }.padding(.horizontal)
        Spacer()

        }
}

struct cardView: View {
    let card: MemoryGame<String>.Card


    //var txt: String
    var body: some View {
        ZStack {
            if card.isFaceUp {
                let shape = RoundedRectangle(cornerRadius: 20)
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.contents).padding()
            }
            else {
                let shape = RoundedRectangle(cornerRadius: 20)
                shape.fill().foregroundColor(.red)
                shape.stroke(lineWidth: 3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
.previewInterfaceOrientation(.portrait)
    }
}
}
