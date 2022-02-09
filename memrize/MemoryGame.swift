//
//  MemoryGame.swift
//  Memorize
//  Ethan Smith 

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
   // private var theme: Theme
    public var score:Int = 0
    private var indexOfTheOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card) {

        if let chosenInd = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenInd].isFaceUp,
           !cards[chosenInd].isMatched
        {
            print("picking ")
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenInd].content == cards[potentialMatchIndex].content {
                    cards[chosenInd].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 1
                }
                indexOfTheOnlyFaceUpCard = nil
                cards[chosenInd].isFaceUp = true
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenInd
            }
            cards[chosenInd].isFaceUp = true

        }
        print("chosenInd = \(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }


}



extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        }
        else {
            return nil
        }
    }
}
