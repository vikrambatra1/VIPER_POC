//
//  FeedDetailsPresenter.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 08/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class FeedDetailsPresenter: FeedDetailsViewToPresenterProtocol {
    
    var view: FeedDetailsPresenterToViewProtocol?
    var router: FeedDetailsPresenterToRouterProtocol?
    var feed: FeedModel?
    
    func getFeedDetails() {
        view?.showFeedDetails(forFeed: feed!)
    }
}
