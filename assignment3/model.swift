
import Foundation

struct SetGame {
// has 81 cards,
private var cards: Array<Card>
private var selected :Array<Card> // currently selected cards
public var score: Int = 0
init() {

}
mutating func pick (_ card: Card) {
  // select a card
  picked = card.id
  // if selected card is already selected, deselect it
  if selected.contains(card){
    let removeme = selected.firstIndex(of: card)
      selected.remove(at:removeme)
      card.selected = false
  }
  else:
    selected.append(card)
    card.selected = true
    //add to selected
  // if three cards are selected, check if they make a set
  if selected.count == 3 {
    for type in ["shape","number","color","shading"]:
      for c in selected:
        private(set) var types = Array<String>
        types.append(c.type)
        if types.count == 4 {
          // this is a set! breaking
        }

    // logic for correct selection here :)
  }
}

}

struct Card: Identifiable {
  var isSelected = false
  var shape = ""
  var number = ""
  var color = ""
  var shading = ""
  var id: Int

}
