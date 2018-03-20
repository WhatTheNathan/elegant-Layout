//
//  Movement.swift
//  Instagram
//
//  Created by Nathan on 08/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import Foundation

class Movement {
    var content : String
    var imageNumber : Int
    var imageUrls : [String]
    var owner_avatar : String
    var owner_userName : String
    
    init(content : String,
         imageNumber : Int,
         imageUrls : [String] = [],
         owner_avatar : String,
         owner_userName : String) {
        self.content = content
        self.imageNumber = imageNumber
        self.imageUrls = imageUrls
        self.owner_avatar = owner_avatar
        self.owner_userName = owner_userName
    }
}
