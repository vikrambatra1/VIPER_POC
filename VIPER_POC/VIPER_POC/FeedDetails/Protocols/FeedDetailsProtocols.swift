//
//  FeedDetailsProtocols.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 08/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

protocol FeedDetailsViewToPresenterProtocol: class {
    var view: FeedDetailsPresenterToViewProtocol? {get set}
    var router: FeedDetailsPresenterToRouterProtocol? {get set}
    var feed: FeedModel? {get set}
    func getFeedDetails()
}

protocol FeedDetailsPresenterToViewProtocol: class {
    var presenter: FeedDetailsViewToPresenterProtocol? { get set }
    func showFeedDetails(forFeed feed: FeedModel)
}

protocol FeedDetailsPresenterToRouterProtocol: class {
    static func createFeedDetailsModule(forFeed feed: FeedModel) -> UIViewController
}
