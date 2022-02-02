//
//  MemoryGame.swift
//  memrize
//
//  Created by Ethan Smith on 1/28/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    mutating func choose(_ card:Card) {
        let chosenIndex = index(of:card)
        cards[chosenIndex].isFaceUp.toggle()
        //var chosenCard = cards[chosenIndex]
        //chosenCard.isFaceUp.toggle()
        print("chosen card = \(cards[chosenIndex])")
        print(" all cards \(cards)")
    }
    func index(of:Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == of.id {
                return index
            }
        }
        return 0 // ??
    }
    init (numberOfPairsOfCards:Int,createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // LOLOLOOLOLOLOOLOLOL I AM BRAINDEAD AND THIS COMMENT IS TOO
        for x in 0..<numberOfPairsOfCards {
            let content = createCardContent(x)
            cards.append(Card(contents: content, id: x*2))
            cards.append(Card(contents: content, id: x*2+1))
            
        }
        
    }
    struct Card: Identifiable {
        

        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var contents: CardContent
        var id: Int
        
    }
}
