//
//  WebContentViewController.swift
//  iOS-Final-Project
//
//  Created by Xcode User on 2019-04-15.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
import WebKit

class WebContentViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView:WKWebView!
    @IBOutlet var activity:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let urlAddress = URL(string: "https://www.google.com/search?q=Procrastify")
        let url=URLRequest(url: urlAddress!)
        webView.load(url)
        webView.navigationDelegate=self

    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }


}
