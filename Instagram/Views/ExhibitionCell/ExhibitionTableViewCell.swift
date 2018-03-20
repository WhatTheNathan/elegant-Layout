//
//  ExhibitionTableViewCell.swift
//  Instagram
//
//  Created by Nathan on 20/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

class ExhibitionTableViewCell: UITableViewCell {
    

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
        
    }

}
