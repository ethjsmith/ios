//
//  ContentView.swift
//  memrize
//
//  Created by Ethan Smith on 1/12/22.
//

import SwiftUI


struct ContentView: View {
    var txts = ["hit","me","with a","bus"]
    var body: some View {
        HStack{
            
            cardView(faceup:false,txt:txts[0])
            cardView(faceup:false,txt:txts[1])
            cardView(faceup:false,txt: txts[2])
            cardView(txt :txts[3])

        }.padding(.horizontal)
    }
}



struct cardView: View {
    @State var faceup : Bool = true
    var txt: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            shape.fill().foregroundColor(.red)
            shape.stroke(lineWidth: 3)
            if faceup {
                shape.foregroundColor(.white)
                Text(txt).font(.largeTitle)
                
            }
            
        }
        .onTapGesture {
            faceup = !faceup
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
