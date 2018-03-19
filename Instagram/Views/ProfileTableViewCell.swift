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
        
        postsButton.into(self.contentView).after(avatar,20).top(20).height(45).width(60).numberOfLines(0).align(.center)
        
        followersButton.into(self.contentView).after(postsButton,20).top(20).height(45).width(60).numberOfLines(0).align(.center)
        
        followingButton.into(self.contentView).after(followersButton,20).top(20).height(45).width(60).numberOfLines(0).align(.center)
        
        editButton.into(self.contentView).after(avatar,40).below(followersButton,10).height(30).width(200).color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).title("Edit Profile").align(.center)
        
        settingButton.into(self.contentView).after(avatar,10).below(followingButton,10).height(30).width(40)
        
        descriptionButton.into(self.contentView).left(15).right(15).below(avatar,10).bottom(5).height(30).align(.left)
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
        
        var number = String(describing: (user?.posts)!)
        var desc = "\nposts"
        dealWithButton(postsButton, number: number, desc: desc, numSize: 16, numFont: .semibold, numColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), descSize: 11, descFont: .regular, descColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        number = String(describing: (user?.followers)!)
        desc = "\nfollowers"
        dealWithButton(followersButton, number: number, desc: desc, numSize: 16, numFont: .semibold, numColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), descSize: 11, descFont: .regular, descColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        number = String(describing: (user?.followings)!)
        desc = "\nfollowings"
        dealWithButton(followingButton, number: number, desc: desc, numSize: 16, numFont: .semibold, numColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), descSize: 11, descFont: .regular, descColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        let descText = user?.description
        let descAttrString = NSMutableAttributedString.init(string: descText!)
        let range = NSRange(location: 0, length: (descText?.length())!)
        descAttrString.font(13, .semibold, range).color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), range)
        descriptionButton.setAttributedTitle(descAttrString, for: .normal)
    }
    
    fileprivate func dealWithButton(_ button: UIButton, number: String, desc: String, numSize: CGFloat, numFont: FontWeight, numColor: UIColor, descSize: CGFloat, descFont: FontWeight, descColor: UIColor) {
        let text = number + desc
        let textAttrString = NSMutableAttributedString.init(string: text)
        
        let numberIndex = number.length()
        let descIndex = desc.length()
        
        let numberRange = NSRange(location: 0, length: numberIndex)
        let descRange = NSRange(location: numberIndex + 1, length: descIndex - 1 )
        
        textAttrString.font(numSize, numFont, numberRange).color(numColor,numberRange).font(descSize, descFont, descRange).color(descColor,descRange)
        button.setAttributedTitle(textAttrString, for: .normal)
    }
}
