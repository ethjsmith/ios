//
//  MemorizeApp.swift
//  Memorize
//  Ethan Smith 

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    private let theme = EmojiMemoryGame.selectedTheme
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game,theme:theme!)
        }
    }
}
