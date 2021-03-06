//
//  GridViewController.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 02/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var feeds: [FeedModel] = []
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.reloadData()
    }
}

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: UICollectionView DataSource & Delegates
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCollectionViewCell", for: indexPath) as! FeedCollectionViewCell
        let feed = feeds[indexPath.item]
        if let imageUrl = feed.imageUrl {
            cell.imageView.loadImage(withUrl: imageUrl)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let parentVC = self.parent as! FeedsViewController
        parentVC.presenter?.showFeedDetail(forFeed: feeds[indexPath.row])
    }
}
