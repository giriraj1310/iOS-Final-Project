//
//  ViewController.swift
//  iOS-Final-Project
//
//  Created by Xcode User on 2019-04-04.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase

//    Test Commit and some comments:
//    This view controller should check if the user has already logged in once (userdefault)
//    if the user has logged in already, segue into the default feed page,
//    if not, then segue into login page. Should all be done in viewDidLoad()

//Login View Controller
//Author:
class ViewController: UIViewController, UITextFieldDelegate, FUIAuthDelegate{
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate

    var authUI:FUIAuth?
    
    @IBOutlet var txtUsername:UITextField!
    @IBOutlet var txtPassword:UITextField!
    @IBOutlet var btnLogin:UIButton!
    @IBOutlet var btnRegister:UIButton!

    
    @IBAction func unwindToHomeVC(sender: UIStoryboardSegue){
        
    }
    
    @IBAction func testLogin(sender:UIButton){
        if Auth.auth().currentUser == nil {
            if let authVC = authUI?.authViewController(){
                present(authVC, animated: true, completion: nil)
            }
//            Auth.auth().signIn(withEmail: txtUsername.text, password: txtPassword.text, completion: { (user, error) in
//                if error == nil {
//                    self.btnLogin.setTitle("Logout", for: .normal)
//                }
//            })
        } else {
            do {
                try Auth.auth().signOut()
                self.btnLogin.setTitle("Login", for: .normal)
            } catch {}
        }
        
//        if mainDelegate.login(loginUsername: txtUsername.text!, loginPassword: txtPassword.text!){
//            let alert = UIAlertController(title: "Logging in",
//                                          message: "Welcome, " + txtUsername.text!,
//                                          preferredStyle: .alert)
//
//            let cancelAction = UIAlertAction(title: "Ok",
//                                             style: .cancel,
//                                             handler: nil)
//            alert.addAction(cancelAction)
//            present(alert, animated:true)
//        } else {
//            let alert = UIAlertController(title: "Failed to login!",
//                                                  message: "Invalid Username or Password",
//                                                  preferredStyle: .alert)
//
//            let cancelAction = UIAlertAction(title: "Ok",
//                                             style: .cancel,
//                                             handler: nil)
//            alert.addAction(cancelAction)
//            present(alert, animated:true)
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeControlsInView()
        
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers :[FUIAuthProvider] = [FUIGoogleAuth(), FUIEmailAuth()]
        authUI?.providers = providers
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error == nil {
            self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
            btnLogin.setTitle("Logout", for: .normal)
        }
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

