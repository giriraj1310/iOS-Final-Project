//
//  SettingsViewController.swift
//  iOS-Final-Project
//
//  Created by Xcode User on 2019-04-15.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    @IBOutlet var btnLogout:UIButton!
    var spinLayer : CALayer?
    
    //mute windows sound?
    //disable notification?
    
    @IBAction func Logoff(sender:UIButton){
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toIndexVC", sender: nil)
        } catch {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogout.layer.cornerRadius = 16
        btnLogout.layer.borderWidth = 1.0
        btnLogout.layer.borderColor = UIColor.blue.cgColor
        
        
        let spinImage = UIImage(named: "img3.png")
        spinLayer = CALayer.init()
        spinLayer?.contents = spinImage?.cgImage
        spinLayer?.bounds = CGRect(x: 0, y:0, width: 150, height: 150)
        spinLayer?.position = CGPoint(x:200, y:200)
        self.view.layer.addSublayer(spinLayer!)
        
        let moveAnimation = CABasicAnimation(keyPath: "transform.rotation")
        moveAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        moveAnimation.fromValue = 0
        moveAnimation.toValue = 2 * Double.pi
        moveAnimation.isRemovedOnCompletion = false
        moveAnimation.duration = 3.0
        moveAnimation.repeatCount = .infinity
        spinLayer?.add(moveAnimation, forKey: "spin")
        
    }
}
