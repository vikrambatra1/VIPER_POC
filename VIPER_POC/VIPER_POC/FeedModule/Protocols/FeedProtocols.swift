//
//  FeedProtocols.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 06/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func fetchFeeds()
    func showFeedDetailsViewController(navigationController: UINavigationController)
}

protocol PresenterToViewProtocol: class {
    func showFeeds(feeds: [FeedModel])
    func showError()
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchFeeds()
}

protocol InteractorToPresenterProtocol: class {
    func feedsFetchedSuccess(feeds: [FeedModel])
    func feedsFetchedFailed()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> FeedsViewController
    func pushToFeedDetailsScreen(navigationConroller: UINavigationController)
}
