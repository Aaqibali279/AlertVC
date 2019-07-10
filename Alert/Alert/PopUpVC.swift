//
//  PopUpVC.swift
//  Alert
//
//  Created by Aqib Ali on 10/07/19.
//  Copyright © 2019 Aqib Ali. All rights reserved.
//

import UIKit
class PopUpVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var array:[String]!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "identifier")
        cell.textLabel?.text = array[indexPath.row]
        cell.detailTextLabel?.text = "this is detail text"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
