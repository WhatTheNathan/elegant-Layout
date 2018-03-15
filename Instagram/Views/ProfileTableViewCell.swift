//
//  ProfileTableViewCell.swift
//  Instagram
//
//  Created by Nathan on 15/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    
    var user : User? {didSet { updateUI() } }
    
    // Mark : - UI stuff
    var avatar = UIImageView()
    var postsButton = UIButton()
    var followersButton = UIButton()
    var followingButton = UIButton()
    var editButton = UIButton()
    var settingButton = UIButton()
    var descriptionButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        setupSubviews()
    }
    
    private func setupSubviews() {
        contentView.background(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        
        avatar.into(self.contentView).left(15).top(20).height(100).width(100)
        
        postsButton.into(self.contentView).after(avatar,50).top(20).height(50).width(50)
        
        followersButton.into(self.contentView).after(postsButton,30).top(20).height(50).width(50)
        
        followingButton.into(self.contentView).after(followersButton,30).top(20).height(50).width(50)
        
        editButton.into(self.contentView).after(avatar,40).below(followersButton,10).height(30).width(200)
        
        settingButton.into(self.contentView).after(avatar,10).below(followingButton,10).height(30).width(40)
        
        descriptionButton.into(self.contentView).left(15).right(15).below(avatar,10).bottom(5).height(30)
    }
    
    private func updateUI() {
        
    }
}
