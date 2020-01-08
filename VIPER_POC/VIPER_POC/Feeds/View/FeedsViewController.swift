//
//  FeedsViewController.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 02/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController {

    var presenter: FeedsViewToPresenterProtocol?
    @IBOutlet weak var listViewContainer: UIView!
    @IBOutlet weak var gridViewContainer: UIView!
    @IBOutlet weak var navBarButton: UIBarButtonItem!
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.fetchFeeds()
    }
    
    //MARK: Button Actions
    @IBAction func barButtonAction(_ sender: Any) {
        if self.listViewContainer.alpha == 0 {
            self.listViewContainer.alpha = 1
            self.gridViewContainer.alpha = 0
            self.navBarButton.title = "Grid"
        } else {
            self.listViewContainer.alpha = 0
            self.gridViewContainer.alpha = 1
            self.navBarButton.title = "List"
        }
    }
}

extension FeedsViewController: FeedsPresenterToViewProtocol {
    func showFeeds(feeds: [FeedModel]) {
        let listViewController = self.children[0] as! ListViewController
        listViewController.feeds = feeds
        
        let gridViewController = self.children[1] as! GridViewController
        gridViewController.feeds = feeds
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Error occured while fetching Feeds", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
