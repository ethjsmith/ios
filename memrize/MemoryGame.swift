//
//  MemoryGame.swift
//  memrize
//
//  Created by Ethan Smith on 1/28/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card:Card) {
  //      if let chosenIndex = index(of:card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].contents == cards[potentialMatchIndex].contents {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
//    func index(of:Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == of.id {
//                return index
//            }
//        }
//        return nil
//    }
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
