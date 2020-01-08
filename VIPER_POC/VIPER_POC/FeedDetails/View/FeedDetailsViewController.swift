//
//  FeedDetailsViewController.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 07/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class FeedDetailsViewController: UIViewController {
    
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedDescription: UILabel!
    var presenter: FeedDetailsViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getFeedDetails()
    }
}

extension FeedDetailsViewController: FeedDetailsPresenterToViewProtocol {
    func showFeedDetails(forFeed feed: FeedModel) {
        self.feedTitleLabel.text = feed.title
        if let imageUrl = feed.imageUrl {
            self.feedImageView.loadImage(withUrl: imageUrl)
        }
        self.feedDescription.text = feed.description
    }
}
