//
//  memrizeApp.swift
//  memrize
//
//  Created by Ethan Smith on 1/12/22.
//

import SwiftUI

@main
struct memrizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
