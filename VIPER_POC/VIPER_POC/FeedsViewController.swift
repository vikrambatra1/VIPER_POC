//
//  FeedsViewController.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 02/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

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
        
        self.loadData()
        
        let listViewController = self.children[0] as! ListViewController
        listViewController.feeds = feeds

        let gridViewController = self.children[1] as! GridViewController
        gridViewController.feeds = feeds
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
        let feedImgs = myParser.img as [AnyObject]
        let myFeeds = myParser.feeds
        self.feeds = self.convertToDataModel(feedImages: feedImgs as! [String], feeds: myFeeds as [AnyObject])
    }
    
    func convertToDataModel(feedImages: [String], feeds: [AnyObject]) -> [FeedModel] {
        var feedList: [FeedModel] = []
        for (index, feed) in feeds.enumerated() {
            let feedDict = feed as! [String: String]
            var imgStr: String?
            if feedImages.indices.contains(index) {
                imgStr = feedImages[index]
            }
            let feedModel = FeedModel(title: feedDict["title"] ?? "", pubData: feedDict["pubData"] ?? "", description: feedDict["description"] ?? "", link: feedDict["link"] ?? "", feedImageUrl: imgStr )
            feedList.append(feedModel)
        }
        return feedList
    }
}
