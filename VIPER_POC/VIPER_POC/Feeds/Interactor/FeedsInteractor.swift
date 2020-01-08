//
//  FeedsInteractor.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 06/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

class FeedsInteractor: FeedsPresenterToInteractorProtocol {

    var presenter: FeedsInteractorToPresenterProtocol?
    
    func fetchFeeds() {
        let url = URL(string: FEEDS_API)!
        let myParser : XmlParserManager = XmlParserManager().initWithURL(url) as! XmlParserManager
        let feedImgs = myParser.img as [AnyObject]
        let myFeeds = myParser.feeds
        let feeds = self.convertToDataModel(feedImages: feedImgs as! [String], feeds: myFeeds as [AnyObject])
        if feeds.count > 0 {
            self.presenter?.feedsFetchedSuccess(feeds: feeds)
        } else {
            self.presenter?.feedsFetchedFailed()
        }
    }

    private func convertToDataModel(feedImages: [String], feeds: [AnyObject]) -> [FeedModel] {
        return feeds.enumerated().map({ (index, feed) in
            let feedDict = feed as! [String: String]
            return FeedModel(title: feedDict["title"] ?? "", pubData: feedDict["pubData"] ?? "", description: feedDict["description"] ?? "", link: feedDict["link"] ?? "", imageUrl: feedImages.indices.contains(index) ? feedImages[index] : nil )
        })
    }
}
