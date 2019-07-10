//
//  ViewController.swift
//  Alert
//
//  Created by Aqib Ali on 12/05/19.
//  Copyright © 2019 Aqib Ali. All rights reserved.
//

import UIKit

extension ViewController:UIPopoverPresentationControllerDelegate{
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}



class ViewController: UIViewController {

    var alert:AlertVC?
    var array = ["gouhndcouhjnd","gyfebd","fgeei","efguhd","feuhdn","ruhdoln","gouhndcouhjnd","gyfebd","fgeei","efguhd","feuhdn","ruhdoln","gouhndcouhjnd","gyfebd","fgeei","efguhd","feuhdn","ruhdoln"]
    
    @IBAction func action(sender:UIButton){
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        
        var height = 50 * 10
        
        if array.count < 10{
            height = 50 * array.count
        }
        
        vc.array = array
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = .init(width: 250, height: height)
        let popover = vc.popoverPresentationController!
        popover.delegate = self
        popover.permittedArrowDirections = .down
        popover.sourceView = sender
        popover.sourceRect = sender.bounds
        
        present(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        let btn = UIButton(frame: .init(x: 0, y: 0, width: 60, height: 40))
        btn.setTitle("Show", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(showAlert(sender:)), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btn)
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func showAlert(sender:UIButton){
        let actions = [
            ("CANCEL",nil),
            ("OK",#selector(okAction))
            ] as [(String,Selector?)]
       alert = showAlertVC(title: "Error",message: "Network not available, please connect to wifi and try again", actions: actions)
    }
    
    
    @objc func okAction(){
        alert?.removeAlert()
        print("Okay")
    }


}



class DetailVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        
    }
    
}

extension UIViewController{
    func showAlertVC(title:String?,message:String?,actions:[(String,Selector?)]) -> AlertVC {
        let alertVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AlertVC") as! AlertVC
        alertVC.titleString = title
        alertVC.message = message
        alertVC.actions = actions
        alertVC.vc = self
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overCurrentContext
        //        alertVC.preferredContentSize = .init(width: 300, height: 250)
        //        let popUp = alertVC.popoverPresentationController
        //        popUp?.delegate = self
        //        popUp?.sourceRect = sender.frame
        //        popUp?.sourceView = sender
        //        popUp?.permittedArrowDirections = .up
        present(alertVC, animated: true)
        return alertVC
    }
}

