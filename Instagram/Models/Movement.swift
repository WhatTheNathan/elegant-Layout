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
    var imageUrls : [URL]
    var owner_avatar : URL
    var owner_userName : String
    
    init(content : String,
         imageNumber : Int,
         imageUrls : [URL] = [],
         owner_avatar : URL,
         owner_userName : String) {
        self.content = content
        self.imageNumber = imageNumber
        self.imageUrls = imageUrls
        self.owner_avatar = owner_avatar
        self.owner_userName = owner_userName
    }
}
