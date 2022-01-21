//
//  ContentView.swift
//  memrize
//
//  Created by Ethan Smith on 1/12/22.
//

import SwiftUI


struct ContentView: View {
    var txts = ["😅1","😅2","😅3","😅4","😅5","😅6","😅7","😅8","😅9","😅0","😅11","😅"]
    @State var cnt = 4
    var body: some View {
        VStack{
            LazyVGrid(columns:[GridItem(),GridItem(),GridItem()]){
        //HStack{
            ForEach(txts[0..<cnt],id: \.self) { t in
                cardView(txt:t).aspectRatio(2/3, contentMode: .fit)
            }
//            cardView(faceup:false,txt:txts[0])
//            cardView(faceup:false,txt:txts[1])
//            cardView(faceup:false,txt: txts[2])
//            cardView(txt :txts[3])

        }.padding(.horizontal)
        Spacer()
            HStack{
        Button(action:{cnt += 1},label:{ Image(systemName:"plus.circle")})
        Spacer()
        Button(action:{cnt -= 1},label:{ Image(systemName:"minus.circle").foregroundColor(.red)})
            }.padding()
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
