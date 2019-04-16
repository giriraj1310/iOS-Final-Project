//
//  CreatePostViewController.swift
//  iOS-Final-Project
//
//  Created by Xcode User on 2019-04-15.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class CreatePostViewController: UIViewController {
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    var authUI:FUIAuth?

    @IBOutlet var btnSubmit:UIButton!
    @IBOutlet var txtTopic:UITextField!
    @IBOutlet var txtSubject:UITextField!
    @IBOutlet var txtBody:UITextView!
    
    @IBAction func btnSubmit(sender:UIButton){
        let topic = txtTopic.text!.replacingOccurrences(of: ".", with: ",")
        let subject = txtSubject.text!.replacingOccurrences(of: ".", with: ",")
        let body = txtBody.text!.replacingOccurrences(of: ".", with: ",")
        
        //Adding Threads
                mainDelegate.ref?.child("threads").childByAutoId()
                    .setValue(["topic":"\(topic)",
                               "subject":"\(subject)",
                               "body":"\(body)",
                               "date":"\(Date())",
                               "poster":"chongl"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSubmit.layer.cornerRadius = 16
        btnSubmit.layer.borderWidth = 1.0
        btnSubmit.layer.borderColor = UIColor.blue.cgColor
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
