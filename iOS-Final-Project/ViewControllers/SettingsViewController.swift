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
    
    
    
    @IBAction func Logoff(sender:UIButton){
        do{
            try Auth.auth().signOut()
        } catch {}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnLogout.layer.cornerRadius = 16
        btnLogout.layer.borderWidth = 1.0
        btnLogout.layer.borderColor = UIColor.blue.cgColor
        // Do any additional setup after loading the view.
    }
    
}
