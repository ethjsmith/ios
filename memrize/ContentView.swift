//
//  EmojiMemoryGameView.swift
//  Memorize
//  Ethan Smith

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    var theme: Theme
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card: card,theme:theme)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
               
            }
            VStack{
                let scr:Int = game.Score()
                Text("Score:\(scr)")
                    Spacer()
                Button(action:{ game.newgame()},label:{HStack{Image(systemName:"arrowtriangle.left.circle"); Text("New Game")}})
                
                
            }
        }
        
        .foregroundColor(colorPick(s: theme.color))
        .padding(.horizontal)
    }
    private func colorPick (s:String) -> Color{
        if s == "red" {
            return .red

        }else if s == "blue" {
            return .blue

        }else if s == "green" {
            return .green

        }else if s == "orange" {
            return .orange

        }else if s == "yellow" {
            return .yellow

        }else if s == "pink" {
            return .pink

        }else {
            return .gray
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var theme:Theme
    var body: some View {
        GeometryReader(content : { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).padding().font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }   else {
                    shape.fill(colorPick(s: theme.color))
                }
            }
        })

    }
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    private func colorPick (s:String) -> Color{
        if s == "red" {
            return .red

        }else if s == "blue" {
            return .blue

        }else if s == "green" {
            return .green

        }else if s == "orange" {
            return .orange

        }else if s == "yellow" {
            return .yellow

        }else if s == "pink" {
            return .pink

        }else {
            return .gray
        }
    }
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.5
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        let theme = EmojiMemoryGame.selectedTheme // pick a random theme.
        EmojiMemoryGameView(game: game, theme: theme!)
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
        EmojiMemoryGameView(game: game, theme: theme!)
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
