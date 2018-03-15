//
//  UserViewController.swift
//  Instagram
//
//  Created by Nathan on 08/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit
import SnapKit

class UserViewController: UIViewController {

    /**
     * 主体为TableView
     * 显示三个Cell : user基本profile,控件栏，动态橱窗栏
     * 动态橱窗栏根据控件的事件动态展示四个不同的Cell
     **/
    
    // Mark : - UI
    private var mainTableView = UITableView()
    
    // Mark : - Model
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// TableView设置
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "Profile")
        
        /// 载入数据
        prepareData()
        
        /// 初始化布局
        layoutUI()
        
        /// Reload
        mainTableView.reloadData()
    }
    
    // 处理耗时操作，设备不同方向的布局，或进一步设置
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func prepareData() {
        self.user = User(username: "whatthenathan", avatar_url: URL(string:"https://avatars3.githubusercontent.com/u/22427632?s=400&u=adab7d249349f905344e7292f279e2966bff0738&v=4")!, followings: 54, followers: 10, description: "Yolo", posts: 7)
    }
    
    private func layoutUI() {
        /*
         * addSubView会触发layoutSubviews
         * layoutSubViews默认不做任何操作，但若重写应注意
         */
        mainTableView.into(self.view).top(44).bottom(0).left(0).right(0)
    }

}


