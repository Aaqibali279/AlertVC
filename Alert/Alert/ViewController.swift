//
//  ViewController.swift
//  Alert
//
//  Created by Aqib Ali on 12/05/19.
//  Copyright © 2019 Aqib Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(frame: .init(x: 0, y: 0, width: 60, height: 40))
        btn.setTitle("Show", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(showAlert(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btn)
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func showAlert(sender:UIButton){
        showAlertVC(title: "Error",message: "Network not available")
    }


}

class DetailVC: UIViewController {
    
    
    override func loadView() {
        super.loadView()
        
    }
    
}

extension UIViewController{
    func showAlertVC(title:String?,message:String?) {
        let alertVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AlertVC") as! AlertVC
        alertVC.titleString = title
        alertVC.message = message
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overCurrentContext
        //        alertVC.preferredContentSize = .init(width: 300, height: 250)
        //        let popUp = alertVC.popoverPresentationController
        //        popUp?.delegate = self
        //        popUp?.sourceRect = sender.frame
        //        popUp?.sourceView = sender
        //        popUp?.permittedArrowDirections = .up
        present(alertVC, animated: true)
    }
}

