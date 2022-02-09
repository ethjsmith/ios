//
//  EmojiMemoryGame.swift
//  Memorize
//  Ethan Smith 


import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    //public var score:Int  = 0
    private static let emojis = ["🏁", "🏳️", "🏳️‍🌈", "🏳️‍⚧️", "🇦🇺", "🏴‍☠️", "🚩", "🇺🇸", "🇯🇵", "🇮🇹", "🇨🇦", "🚗", "🚕", "🚓", "🚑", "🚒", "🛻", "🚜", "🏎", "🚛"]
    
    public static var theme1 = Theme(initname: "flags", initcardContent:["🏁", "🏳️", "🏳️‍🌈", "🏳️‍⚧️", "🇦🇺", "🏴‍☠️", "🚩", "🇺🇸", "🇯🇵", "🇮🇹", "🇨🇦"], initpairs: 2500, initcolor: "red")
    public static var theme2 = Theme(initname: "faces", initcardContent: ["🧐","🤓","😁"], initpairs: 3, initcolor: "blue")
    public static var theme3 = Theme(initname: "vechicles", initcardContent: ["🚗", "🚕", "🚓", "🚑", "🚒", "🛻", "🚜", "🏎", "🚛"], initpairs: 9, initcolor: "green")
    public static var theme4 = Theme(initname: "plants", initcardContent: ["🌱","🌲","🍃","🪵"], initpairs: 4, initcolor: "orange")
    public static var theme5 = Theme(initname: "more faces", initcardContent: ["😅","🤩","😇","😍","🤣","🥸"], initpairs: 6, initcolor: "yellow")
    public static var theme6 = Theme(initname: "hands", initcardContent: ["👏","🤞","👍","🤟","👌","🤙","🤌"], initpairs: 7, initcolor: "pink")
    public static let themes = [theme1,theme2,theme3,theme4,theme5,theme6]
    
    public static var selectedTheme = themes.randomElement()
    public func Score() -> Int {
        return model.score
    }
    private static func createMemoryGame(t:Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: t.pairs) {
            pairIndex in t.cardcontent[pairIndex]
            
        }
    }
    public func newgame() {
        EmojiMemoryGame.selectedTheme = EmojiMemoryGame.themes.randomElement() //select new theme
        //return createMemoryGame(t: selectedTheme!) // idk
    }
    
    @Published private var model = createMemoryGame(t:selectedTheme!)
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - User Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
