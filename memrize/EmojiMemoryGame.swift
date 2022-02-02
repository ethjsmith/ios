//
//  EmojiMemoryGame.swift
//  memrize
//
//  Created by Ethan Smith on 1/28/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["😀","😅","😁","😇","😍","🧐","🤓","🤩"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {
            i in emojis[i]
            
        }
    }
    
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    // MemoryGame<String>(numberOfPairsOfCards: 4) {i in emojis[i]} // this is so dumb honestly // this is just another way to do this , instead of our function above
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    // mark: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card)
    }
}
