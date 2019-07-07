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
    @IBOutlet weak var stackView: UIStackView!
    
    var titleString:String?
    var message:String?
    var actions:[(String,Selector?)]?
    var vc:UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleString
        messageLabel.text = message
        
        actions?.forEach({ (item) in
            let action = UIButton()
            action.setTitle(item.0, for: .normal)
            action.setTitleColor(.white, for: .normal)
            if let selector = item.1{
                action.addTarget(vc, action: selector, for: .touchUpInside)
                action.backgroundColor = .blue
            }else{
                action.addTarget(self, action: #selector(removeAlert), for: .touchUpInside)
                action.backgroundColor = .red
            }
            
            stackView.addArrangedSubview(action)
        })

    }
    
    @objc func removeAlert(){
        self.dismiss(animated: true)
    }
    
}
