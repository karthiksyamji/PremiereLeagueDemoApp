//
//  TweetData.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/26/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import Foundation

struct TweetData {
    var tweet: String?
    var createdDate: String?
    var sortDate: Date?
}

struct TweetList {
    var tweets: [TweetData]?
}
