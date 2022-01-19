//
//  ContentView.swift
//  memrize
//
//  Created by Ethan Smith on 1/12/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        return ZStack(alignment:.top, content:{
            RoundedRectangle(cornerRadius: 160).foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/).blur(radius:10)
            Circle().foregroundColor(.red).blur(radius: 50)
            Text("Hello, world!").foregroundColor(Color.green).padding(.all).controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)

        }).padding()



    }

}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
