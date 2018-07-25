//
//  TeamTweetsViewController.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/25/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import UIKit
import WebKit

class TeamTweetsViewController: UIViewController {
    
    @IBOutlet weak var tweetWebView: WKWebView!
    
    var tweetKeyword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = Texts.Titles.tweets
        loadWebView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebView() {
        let tweetUrlString =  Texts.WebConstants.twitterSearch + tweetKeyword!
        let tweetUrl = URL(string:tweetUrlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        let myRequest = URLRequest(url: tweetUrl!)
        tweetWebView.load(myRequest)
    }
}
