//
//  FeedTableViewCell.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 02/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var feedTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
