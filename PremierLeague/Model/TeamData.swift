//
//  TeamDetails.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/25/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import Foundation

struct TeamData: Decodable {
    var id: Int?
    var name: String?
    var image: String?
    var hashTag: String?
}

struct TeamList: Decodable {
    var TeamListData: [TeamData]?
}
