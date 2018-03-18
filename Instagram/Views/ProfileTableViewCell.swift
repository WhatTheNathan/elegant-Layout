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
        
        postsButton.into(self.contentView).after(avatar,50).top(20).height(50).width(50).color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        followersButton.into(self.contentView).after(postsButton,30).top(20).height(50).width(50).color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        followingButton.into(self.contentView).after(followersButton,30).top(20).height(50).width(50).color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        editButton.into(self.contentView).after(avatar,40).below(followersButton,10).height(30).width(200).color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).title("Edit Profile")
        
        settingButton.into(self.contentView).after(avatar,10).below(followingButton,10).height(30).width(40).color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        descriptionButton.into(self.contentView).left(15).right(15).below(avatar,10).bottom(5).height(30).color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    }
    
    private func updateUI() {
//        avatar.image = UIImage.init(named: (user?.avatar_url)!)
//        avatar.layer.masksToBounds = true
//        avatar.layer.cornerRadius = 50.0
        DispatchQueue.global(qos: .default).async {
            let newImage = UIImage.init(named: (self.user?.avatar_url)!)?.drawCircleImage()
            DispatchQueue.main.async {
                self.avatar.image = newImage
            }
        }
        
        postsButton.setTitle(String(describing: user?.posts) + "/nPosts", for: .normal)
        
        followersButton.setTitle(String(describing: user?.followers) + "/nFollowers", for: .normal)
        followingButton.setTitle(String(describing: user?.followings) + "/nFollowings", for: .normal)
        
        descriptionButton.setTitle(user?.description, for: .normal)
        
    }
}
