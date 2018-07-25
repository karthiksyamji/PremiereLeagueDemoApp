//
//  TeamDetailTableViewCell.swift
//  PremierLeague
//
//  Created by Karthik Syamji on 7/25/18.
//  Copyright © 2018 Karthik Syamji. All rights reserved.
//

import UIKit

struct TeamListCellModel {
    var name = ""
    var id: Int = 0
    var image = ""
    
    init(teamData: TeamData){
        guard let name = teamData.name, let image = teamData.image, let id = teamData.id else {
            return
        }
        self.name = name
        self.image = image
        self.id = id
    }
}

class TeamDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var model: TeamListCellModel? {
        didSet {
            guard let model = model else { return }
            nameLabel.text = model.name
            logoImageView.image = UIImage(named: model.image)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.logoImageView.layer.cornerRadius = self.logoImageView.frame.size.width/2
//        self.logoImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
