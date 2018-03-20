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
     * 显示两个Cell : user基本profile+控件栏，动态橱窗栏
     * 动态橱窗栏根据控件的事件动态展示四个不同的Cell
     * 动态实现:
     * 1. KVO,维持一个被监听的属性
     * 2. delegate 四个cell成为ProfileCell的delegate
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
        mainTableView.separatorStyle = .none
        mainTableView.allowsSelection = false
        
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
    
    // addSubview，scroll,改变frame等时候调用，用到才重写，基本用于横竖屏切换时
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func prepareData() {
        self.user = User(username: "whatthenathan", avatar_url: "avatar", followings: 54, followers: 10, description: "You only live once", posts: 7)
    }
    
    private func layoutUI() {
        mainTableView.into(self.view).top(0).bottom(0).left(0).right(0)
    }

}


