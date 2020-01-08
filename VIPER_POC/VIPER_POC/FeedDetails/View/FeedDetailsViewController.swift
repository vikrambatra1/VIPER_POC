//
//  FeedDetailsViewController.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 07/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class FeedDetailsViewController: UIViewController {
    
    var presenter: FeedDetailsViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getFeedDetails()
    }
}

extension FeedDetailsViewController: FeedDetailsPresenterToViewProtocol {
    func showFeedDetails(forFeed feed: FeedModel) {
        print(feed)
    }
}
