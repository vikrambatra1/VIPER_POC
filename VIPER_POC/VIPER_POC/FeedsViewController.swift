//
//  FeedsViewController.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 02/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import SwiftyXMLParser

class FeedsViewController: UIViewController, XMLParserDelegate {

    @IBOutlet weak var listViewContainer: UIView!
    @IBOutlet weak var gridViewContainer: UIView!
    @IBOutlet weak var navBarButton: UIBarButtonItem!
    var feeds: [FeedModel] = []
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let feed1 = FeedModel(feedTitle: "Title1", feedImage: UIImage(named: "defaultFeedImage")!, feedDescription: "AAAAAAAAAAA")
        let feed2 = FeedModel(feedTitle: "Title2", feedImage: UIImage(named: "defaultFeedImage")!, feedDescription: "BBBBBBBBBB")
        let feed3 = FeedModel(feedTitle: "Title3", feedImage: UIImage(named: "defaultFeedImage")!, feedDescription: "CCCCCCCCC")
        let feed4 = FeedModel(feedTitle: "Title4", feedImage: UIImage(named: "defaultFeedImage")!, feedDescription: "AAAAAAAAAAA")
        let feed5 = FeedModel(feedTitle: "Title1", feedImage: UIImage(named: "defaultFeedImage")!, feedDescription: "AAAAAAAAAAA")
        let feed6 = FeedModel(feedTitle: "Title1", feedImage: UIImage(named: "defaultFeedImage")!, feedDescription: "AAAAAAAAAAA")
        let feed7 = FeedModel(feedTitle: "Title1", feedImage: UIImage(named: "defaultFeedImage")!, feedDescription: "AAAAAAAAAAA")
        let feed8 = FeedModel(feedTitle: "Title1", feedImage: UIImage(named: "defaultFeedImage")!, feedDescription: "AAAAAAAAAAA")

        feeds.append(feed1)
        feeds.append(feed2)
        feeds.append(feed3)
        feeds.append(feed4)
        feeds.append(feed5)
        feeds.append(feed6)
        feeds.append(feed7)
        feeds.append(feed8)
        
        let aa = self.children[0] as! ListViewController
        aa.feeds = feeds

        let bb = self.children[1] as! GridViewController
        bb.feeds = feeds
        
//        self.loadData()
        
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
    
    func loadData() {
        let url = URL(string: "https://feeds.skynews.com/feeds/rss/technology.xml")!
        let myParser : XmlParserManager = XmlParserManager().initWithURL(url) as! XmlParserManager
//        let feedImgs = myParser.img as [AnyObject]
        let myFeeds = myParser.feeds
    }
}
