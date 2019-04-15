//
//  HomeViewController.swift
//  iOS-Final-Project
//
//  Created by Xcode User on 2019-04-15.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
import UserNotifications
import AVFoundation
import Firebase

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func unwindToHomeVC(sender: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.threads.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = mainDelegate.threads[rowNum].subject
        tableCell.secondaryLabel.text = mainDelegate.threads[rowNum].body
        tableCell.thirdLabel.text = "Posted by:" + mainDelegate.threads[rowNum].poster!
        //tableCell.myimageView.image = UIImage(named:mainDelegate.people[rowNum].avatarLink!)
        tableCell.accessoryType = .disclosureIndicator
        tableCell.backgroundColor = UIColor.clear
        return tableCell
    }

    override func viewWillAppear(_ animated: Bool) {
        mainDelegate.retrieveThreadsData()
    }
    

}
