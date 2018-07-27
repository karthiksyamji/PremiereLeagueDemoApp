//
//  TweetsTableViewCell.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/27/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import UIKit

struct TweetCellModel {
    var description = ""
    var date = ""
    var tag = ""
    
    init(tweetData: TweetData, hashTag: String){
        guard let description = tweetData.tweet, let date = tweetData.createdDate else {
            return
        }
        self.description = description
        self.date = date
        self.tag = hashTag
    }
}

class TweetsTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetDescription: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var hashTag: UILabel!
    
    var model: TweetCellModel? {
        didSet {
            guard let model = model else { return }
            tweetDescription.text = model.description
            createdDate.text = model.date
            hashTag.text = model.tag
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
