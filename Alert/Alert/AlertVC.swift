//
//  AlertVC.swift
//  Alert
//
//  Created by Aqib Ali on 12/05/19.
//  Copyright © 2019 Aqib Ali. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var messageLabel:UILabel!
    
    var titleString:String?
    var message:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleString
        messageLabel.text = message

    }
    
    @IBAction func ok(){
        dismiss(animated: true)
    }
}
