//
//  MovementCollectionViewCell.swift
//  Instagram
//
//  Created by Nathan on 29/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

class MovementCollectionViewCell: UICollectionViewCell {
    var movement : Movement? { didSet{ updateUI() } }
    
    var insImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        insImage.into(self.contentView).top(0).left(0).right(0).bottom(0)
    }
    
    private func updateUI() {
        insImage.image = UIImage.init(named: (self.movement?.imageUrls[0])!)
    }
}
