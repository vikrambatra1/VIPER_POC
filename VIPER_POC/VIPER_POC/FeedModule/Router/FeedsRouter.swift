//
//  FeedsRouter.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 06/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class FeedsRouter: PresenterToRouterProtocol {
    static func createModule() -> FeedsViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "FeedsViewController") as! FeedsViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = FeedsPresenter()
        let interactor: PresenterToInteractorProtocol = FeedsInteractor()
        let router:PresenterToRouterProtocol = FeedsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToFeedDetailsScreen(navigationConroller: UINavigationController) {
        let feedModule = FeedsRouter.createModule()
        navigationConroller.pushViewController(feedModule, animated: true)
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
