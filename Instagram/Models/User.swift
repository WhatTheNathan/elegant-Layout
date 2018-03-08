//
//  User.swift
//  Instagram
//
//  Created by Nathan on 08/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import Foundation

class User {
    var username : String
    var avatar_url : URL
    var followings : String
    var followers : String
    var description : String
    var posts : Int
    
    init(username: String,
         avatar_url: URL,
         followings: String,
         followers: String,
         description: String,
         posts: Int) {
        self.username = username
        self.avatar_url = avatar_url
        self.followers = followers
        self.followings = followings
        self.description = description
        self.posts = posts
    }
}
