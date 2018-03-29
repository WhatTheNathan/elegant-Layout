//
//  ExhibitionTableViewCell.swift
//  Instagram
//
//  Created by Nathan on 20/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

class ExhibitionTableViewCell: UITableViewCell {
    
    // Mark: - Model
    var movements: [Movement] = [] { didSet { updateUI() } }
    
    private var collectionView: UICollectionView!
    private let flowLayout = UICollectionViewFlowLayout()

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
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.register(MovementCollectionViewCell.self, forCellWithReuseIdentifier: "exhibition")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        
        collectionView.into(self.contentView).top(0).left(0).right(0).bottom(0).background(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    
    private func updateUI() {
        collectionView.reloadData()
    }
}

extension ExhibitionTableViewCell: UICollectionViewDelegate {
    
}

extension ExhibitionTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exhibition", for: indexPath) as! MovementCollectionViewCell
        cell.movement = self.movements[indexPath.row]
        return cell
    }
}
