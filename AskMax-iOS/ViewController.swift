//
//  ViewController.swift
//  AskMax-iOS
//
//  Created by Vitaliy Radchishin on 2/4/16.
//  Copyright © 2016 UWT Student Engineers. All rights reserved.
//

import Gloss
import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate {
    let database = DatabaseJSON()
    
    var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        webView = WKWebView(frame: view.frame)
        view.insertSubview(webView, atIndex: 0)
        initMap()
    }

    // Opens the AskMax-Common map in the web view.
    func initMap() {
        let mapUrl = NSBundle.mainBundle().URLForResource("map", withExtension: "html", subdirectory: "common/html")
        webView.loadFileURL(mapUrl!, allowingReadAccessToURL: mapUrl!)
    }
    
    // This function gets called every time the user changes the contents of the search bar.
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        let searchResult = performSearch(searchText)
        webView?.evaluateJavaScript("centerCamera(\(searchResult))", completionHandler: nil)
    }
    
    // Returns a json string containing the buildings that were found by the passed query.
    func performSearch(string: String) -> String {
        // Normalize the string first.
        let query = string.lowercaseString
    
        let locations = database.search(query)
        
        if let locationsJson = locations.toJSONArray(), data = try? NSJSONSerialization.dataWithJSONObject(locationsJson, options: NSJSONWritingOptions()), json = NSString(data: data, encoding: NSUTF8StringEncoding) {
            return String(json)
        } else {
            return "[]"
        }
    }
}