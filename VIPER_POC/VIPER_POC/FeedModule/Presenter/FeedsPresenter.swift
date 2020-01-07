//
//  FeedsPresenter.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 06/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class FeedsPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func fetchFeeds() {
        interactor?.fetchFeeds()
    }

    func showFeedDetailsViewController(navigationController: UINavigationController) {
        router?.pushToFeedDetailsScreen(navigationConroller: navigationController)
    }
}

extension FeedsPresenter: InteractorToPresenterProtocol {
    func feedsFetchedSuccess(feeds: [FeedModel]) {
        view?.showFeeds(feeds: feeds)
    }
    
    func feedsFetchedFailed() {
        view?.showError()
    }
}
