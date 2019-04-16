//
//  ViewPostViewController.swift
//  iOS-Final-Project
//
//  Created by Xcode User on 2019-04-15.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit

class ViewPostViewController: UIViewController {

    @IBOutlet var lblTopic:UILabel!
    @IBOutlet var lblSubject:UILabel!
    @IBOutlet var lblBody:UILabel!
    @IBOutlet var lblDate:UILabel!
    @IBOutlet var lblPoster:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        mainDelegate.retrieveThreadsData()
        lblTopic.text = mainDelegate.threads[mainDelegate.intSelected].topic
        lblSubject.text = mainDelegate.threads[mainDelegate.intSelected].subject
        lblBody.text = mainDelegate.threads[mainDelegate.intSelected].body
        lblDate.text = mainDelegate.threads[mainDelegate.intSelected].date
        lblPoster.text = mainDelegate.threads[mainDelegate.intSelected].poster
    }
    

}
