//
//  theme.swift
//  memrize
//
//  Created by Ethan Smith on 2/9/22.
//

import Foundation

struct Theme {
    let name: String
    var cardcontent: [String]
    var pairs: Int
    let color: String
    init(initname:String,initcardContent:[String],initpairs:Int,initcolor:String) {
        name = initname
        cardcontent = initcardContent.shuffled() // lol :)
        pairs = initpairs
        if pairs > cardcontent.count { // downsizes the count of cards if too many pairs were added.
            pairs = cardcontent.count
        }
        color = initcolor
    }
}
