//
//  VerticalTableViewCell.swift
//  Instagram
//
//  Created by Nathan on 20/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

class VerticalTableViewCell: UITableViewCell {
    
    // Mark: - Model
    var movements: [Movement] = [] { didSet { updateUI() } }
    
    var tableView = UITableView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovementTableViewCell.self, forCellReuseIdentifier: "Movement")
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        tableView.dragInteractionEnabled = false
        tableView.isScrollEnabled = false
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        tableView.into(self.contentView).top(0).left(0).right(0).bottom(0)
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
}

extension VerticalTableViewCell: UITableViewDelegate {
    
}

extension VerticalTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movement", for: indexPath) as! MovementTableViewCell
        cell.movement = movements[indexPath.row]
        return cell
    }
}
