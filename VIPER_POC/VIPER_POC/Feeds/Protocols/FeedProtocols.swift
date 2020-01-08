//
//  FeedProtocols.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 06/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

protocol FeedsViewToPresenterProtocol: class {
    var view: FeedsPresenterToViewProtocol? {get set}
    var interactor: FeedsPresenterToInteractorProtocol? {get set}
    var router: FeedsPresenterToRouterProtocol? {get set}
    func fetchFeeds()
    func showFeedDetail(forFeed feed: FeedModel)
}

protocol FeedsPresenterToViewProtocol: class {
    func showFeeds(feeds: [FeedModel])
    func showError()
}

protocol FeedsPresenterToInteractorProtocol: class {
    var presenter: FeedsInteractorToPresenterProtocol? {get set}
    func fetchFeeds()
}

protocol FeedsInteractorToPresenterProtocol: class {
    func feedsFetchedSuccess(feeds: [FeedModel])
    func feedsFetchedFailed()
}

protocol FeedsPresenterToRouterProtocol: class {
    static func createFeedsModule()-> FeedsViewController
    func pushFeedDetailScreen(from view: FeedsPresenterToViewProtocol, forFeed feed: FeedModel)
}
