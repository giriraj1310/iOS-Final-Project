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
import UserNotifications

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

    
    @IBAction func unwindToIndexVC(sender: UIStoryboardSegue){
        
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
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            //
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Procrastinating?"
        content.body = "Procrastinate no more"
        
        let date = Date().addingTimeInterval(15)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (Error) in
            //
        }
        initializeControlsInView()
        
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers :[FUIAuthProvider] = [FUIGoogleAuth(), FUIEmailAuth()]
        authUI?.providers = providers
        
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser != nil {
            print("HELOOoOOOOOOOOoOOO")
            print(Auth.auth().currentUser?.email)
            self.performSegue(withIdentifier: "toHomeViewController", sender: nil)
        }
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

