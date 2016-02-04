//
//  ViewController.swift
//  AskMax-iOS
//
//  Created by Vitaliy Radchishin on 2/4/16.
//  Copyright © 2016 UWT Student Engineers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSBundle.mainBundle().URLForResource("map", withExtension: "html", subdirectory: "common/html")
        let request = NSURLRequest(URL:url!)
        
        webView.delegate = self
        webView.loadRequest(request)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("finished loading")
    }

    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(error)
    }
}

