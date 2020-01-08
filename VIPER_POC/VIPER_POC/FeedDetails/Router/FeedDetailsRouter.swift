//
//  FeedDetailsRouter.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 08/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class FeedDetailsRouter: FeedDetailsPresenterToRouterProtocol {
    static func createFeedDetailsModule(forFeed feed: FeedModel) -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "FeedDetailsViewController") as! FeedDetailsViewController
        
        let presenter: FeedDetailsViewToPresenterProtocol = FeedDetailsPresenter()
        let router: FeedDetailsPresenterToRouterProtocol = FeedDetailsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.feed = feed
        presenter.router = router

        return view
    }

    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
