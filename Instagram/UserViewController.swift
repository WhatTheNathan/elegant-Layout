//
//  UserViewController.swift
//  Instagram
//
//  Created by Nathan on 08/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    /**
     * 主体为TableView
     * 显示三个Cell : user基本profile,控件栏，动态橱窗栏
     * 动态橱窗栏根据控件的事件动态展示四个不同的Cell
     **/
    
    //Mark : - UI
    var mainTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
