//
//  ViewController.swift
//  AskMax-iOS
//
//  Created by Vitaliy Radchishin on 2/4/16.
//  Copyright © 2016 UWT Student Engineers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        initMap()
    }
    
    // Opens the AskMax-Common map in the web view.
    func initMap() {
        let url = NSBundle.mainBundle().URLForResource("map", withExtension: "html", subdirectory: "common/html")
        let request = NSURLRequest(URL:url!)
        
        webView.delegate = self
        webView.loadRequest(request)
    }
    
    // This function gets called when the web view finishes loading.
    func webViewDidFinishLoad(webView: UIWebView) {
        searchBar.hidden = false
    }
    
    // This function gets called every time the user changes the contents of the search bar.
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("Searching for " + searchText)
    }
}

