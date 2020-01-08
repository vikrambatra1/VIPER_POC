//
//  FeedsRouter.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 06/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class FeedsRouter: FeedsPresenterToRouterProtocol {
    static func createFeedsModule() -> FeedsViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "FeedsViewController") as! FeedsViewController
        
        let presenter: FeedsViewToPresenterProtocol & FeedsInteractorToPresenterProtocol = FeedsPresenter()
        let interactor: FeedsPresenterToInteractorProtocol = FeedsInteractor()
        let router: FeedsPresenterToRouterProtocol = FeedsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushFeedDetailScreen(from view: FeedsPresenterToViewProtocol, forFeed feed: FeedModel) {
        let feedDetailsViewController = FeedDetailsRouter.createFeedDetailsModule(forFeed: feed)
        if let feedsViewController = view as? UIViewController {
            feedsViewController.navigationController?
                .pushViewController(feedDetailsViewController, animated: true)
        }
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
