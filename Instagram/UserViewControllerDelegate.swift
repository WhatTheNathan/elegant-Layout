//
//  UserViewControllerDelegate.swift
//  Instagram
//
//  Created by Nathan on 15/03/2018.
//  Copyright © 2018 Nathan. All rights reserved.
//

import Foundation
import UIKit

extension UserViewController : UITableViewDelegate {
}

extension UserViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Profile", for: indexPath) as! ProfileTableViewCell
        cell.user = self.user
        return cell
    }
    
    
}
