//
//  UserViewController.swift
//  Instagram
//
//  Created by Nathan on 08/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit
import SnapKit

enum userItem {
    case user(User)
    case vertical([Movement])
    case exhibition([Movement])
}

class UserViewController: UIViewController {

    /**
     * 主体为TableView
     * 显示两个Cell : user基本profile+控件栏，动态橱窗栏
     * 动态橱窗栏根据控件的事件动态展示四个不同的Cell
     * 动态实现:
     * 1. KVO,维持一个被监听的属性
     * 2. delegate UserVC成为profileCell的delegate
     **/
    
    // Mark : - UI
    private var mainTableView = UITableView()
    
    // Mark : - Model
    fileprivate var user : User?
    fileprivate var movements : [Movement] = []
    fileprivate var model : [userItem] = []
    
    var state = userItem.vertical([]) {
        didSet {
            model.removeAll()
            model.append(userItem.user(self.user!))
            switch state {
            case .exhibition(_):
                self.model.append(userItem.exhibition(self.movements))
            case .vertical(_):
                self.model.append(userItem.vertical(self.movements))
            default:
                break
            }
            self.mainTableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// TableView设置
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "Profile")
        mainTableView.register(VerticalTableViewCell.self, forCellReuseIdentifier: "Vertical")
        mainTableView.register(ExhibitionTableViewCell.self, forCellReuseIdentifier: "Exhibition")
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
        let movement_1 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_2 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_3 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_4 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_5 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_6 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_7 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_8 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_9 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_10 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_11 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_12 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_13 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_14 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_15 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_16 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        let movement_17 = Movement(content: "testtest", imageNumber: 1, imageUrls: ["movement"], owner_avatar: "avatar", owner_userName: "whatthenathan")
        self.movements.append(movement_1)
        self.movements.append(movement_2)
        self.movements.append(movement_3)
        self.movements.append(movement_4)
        self.movements.append(movement_5)
        self.movements.append(movement_6)
        self.movements.append(movement_7)
        self.movements.append(movement_8)
        self.movements.append(movement_9)
        self.movements.append(movement_10)
        self.movements.append(movement_11)
        self.movements.append(movement_12)
        self.movements.append(movement_13)
        self.movements.append(movement_14)
        self.movements.append(movement_15)
        self.movements.append(movement_16)
        self.movements.append(movement_17)
        
        self.model.append(userItem.user(self.user!))
        self.model.append(userItem.vertical(self.movements))
//        self.model.append(userItem.exhibition(self.movements))
    }
    
    private func layoutUI() {
        mainTableView.into(self.view).top(0).bottom(0).left(0).right(0)
    }

}

extension UserViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = model[indexPath.row]
        switch item {
        case .user(_):
            return UITableViewAutomaticDimension
        case .vertical(let movements):
            return CGFloat(495 * movements.count)
        case .exhibition(let movements):
            let rows = (CGFloat)(movements.count / 3)
            return rows * (UIScreen.main.bounds.width / 3)
        }
    }
}

extension UserViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = model[indexPath.row]
        switch item {
        case .user(let user):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Profile", for: indexPath) as! ProfileTableViewCell
            cell.user = user
            cell.delegate = self
            return cell
        case .vertical(let movements):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Vertical", for: indexPath) as! VerticalTableViewCell
            cell.movements = movements
            return cell
        case .exhibition(let movements):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Exhibition", for: indexPath) as! ExhibitionTableViewCell
            cell.movements = movements
            return cell
        }
    }
}

extension UserViewController: SwitchCellProtocol {
    func switchCell(item: userItem) {
        self.state = item
    }
}
