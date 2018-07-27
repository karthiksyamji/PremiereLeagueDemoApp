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
    
    let manager = TeamDataManager()
    var tweetKeyword: String?
    var tweets = [TweetData]()
    
    @IBOutlet weak var tweetsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = Texts.Titles.tweets
        initializeView()
        getTweets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TeamTweetsViewController {
    
    func initializeView() {
        tweetsTable.register(UINib.init(nibName: Texts.CustomNib.TweetCell, bundle: nil), forCellReuseIdentifier: Texts.CustomNib.TweetCell)
        self.tweetsTable.rowHeight = UITableViewAutomaticDimension
        self.tweetsTable.estimatedRowHeight = 250
    }
    
    func getTweets() {
        manager.getTweets(param: tweetKeyword!) { (tweets, error) in
            if let error = error {
                self.showAlert(error.localizedDescription, actions: nil)
                return
            }
            guard let tweetData = tweets else {
                return
            }
            self.tweets = tweetData
            self.tweetsTable.reloadData()
        }
    }
}

//MARK:- TableView Data Source and Delegates

extension TeamTweetsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :  TweetsTableViewCell = tableView.dequeueReusableCell(withIdentifier: Texts.CustomNib.TweetCell) as! TweetsTableViewCell
        cell.model = TweetCellModel(tweetData: self.tweets[indexPath.row], hashTag: tweetKeyword!)
        return cell
    }
}
