//
//  FeedsPresenter.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 06/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class FeedsPresenter: FeedsViewToPresenterProtocol {
    
    var view: FeedsPresenterToViewProtocol?
    var interactor: FeedsPresenterToInteractorProtocol?
    var router: FeedsPresenterToRouterProtocol?
    
    func fetchFeeds() {
        interactor?.fetchFeeds()
    }

    func showFeedDetail(forFeed feed: FeedModel) {
        router?.pushFeedDetailScreen(from: view!, forFeed: feed)
    }
}

extension FeedsPresenter: FeedsInteractorToPresenterProtocol {
    func feedsFetchedSuccess(feeds: [FeedModel]) {
        view?.showFeeds(feeds: feeds)
    }
    
    func feedsFetchedFailed() {
        view?.showError()
    }
}
