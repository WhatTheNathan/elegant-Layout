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
    var avatar_url : String
    var followings : Int
    var followers : Int
    var description : String
    var posts : Int
    
    init(username: String,
         avatar_url: String,
         followings: Int,
         followers: Int,
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
