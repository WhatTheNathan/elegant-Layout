//
//  MovementTableViewCell.swift
//  Instagram
//
//  Created by Nathan on 20/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

class MovementTableViewCell: UITableViewCell {
    
    var movement : Movement? { didSet{ updateUI() } }
    
    var avatar = UIImageView()
    var username = UILabel()
    var insImage = UIImageView()
    var content = UILabel()
    
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
        avatar.into(contentView).left(5).top(5).width(70).height(70)
        
        username.into(contentView).after(avatar,10).top(10).height(30).width(200)
        
        insImage.into(contentView).below(avatar,5).left(0).right(0).height(375)
        
        content.into(contentView).below(insImage,10).bottom(5).left(5).right(5).height(25)
    }
    
    private func updateUI() {
        DispatchQueue.global().async {
            let avatarImage = UIImage.init(named: (self.movement?.owner_avatar)!)?.drawCircleImage()
            DispatchQueue.main.async {
                self.avatar.image = avatarImage
            }
        }
        
        insImage.image = UIImage.init(named: (self.movement?.imageUrls[0])!)
        
        username.text((movement?.owner_userName)!)
        
        content.text((movement?.content)!)
        
    }
}
