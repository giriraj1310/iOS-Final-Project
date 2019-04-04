//
//  ViewController.swift
//  iOS-Final-Project
//
//  Created by Xcode User on 2019-04-04.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit

//    Test Commit and some comments:
//    This view controller should check if the user has already logged in once (userdefault)
//    if the user has logged in already, segue into the default feed page,
//    if not, then segue into login page. Should all be done in viewDidLoad()

//Login View Controller
//Author:
class ViewController: UIViewController, UITextFieldDelegate{
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var txtUsername:UITextField!
    @IBOutlet var txtPassword:UITextField!
    @IBOutlet var btnLogin:UIButton!
    @IBOutlet var btnRegister:UIButton!

    
    @IBAction func testLogin(sender:UIButton){
        if mainDelegate.login(loginUsername: txtUsername.text!, loginPassword: txtPassword.text!){
            let alert = UIAlertController(title: "Logging in",
                                          message: "Welcome, " + txtUsername.text!,
                                          preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok",
                                             style: .cancel,
                                             handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated:true)
        } else {
            let alert = UIAlertController(title: "Failed to login!",
                                                  message: "Invalid Username or Password",
                                                  preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Ok",
                                             style: .cancel,
                                             handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated:true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeControlsInView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func initializeControlsInView(){
        //UITextField Controllers
        txtUsername.layer.cornerRadius = 16
        txtUsername.layer.borderWidth = 1
        txtUsername.layer.borderColor = UIColor.green.cgColor
        txtPassword.layer.cornerRadius = 16
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = UIColor.green.cgColor
        
        //UIButton Controllers
        btnLogin.layer.cornerRadius = 16
        btnLogin.layer.borderWidth = 1.0
        btnLogin.layer.borderColor = UIColor.blue.cgColor
        btnRegister.layer.cornerRadius = 16
        btnRegister.layer.borderWidth = 1
        btnRegister.layer.borderColor = UIColor.blue.cgColor
    }
}

