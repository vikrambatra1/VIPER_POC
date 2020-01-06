//
//  ListViewController.swift
//  VIPER_POC
//
//  Created by Vikram Batra1 on 02/01/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var feedsTableView: UITableView!
    var feeds: [FeedModel] = []
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.feedsTableView.reloadData()
    }
}
    
//MARK: TableView Delegate & Datasource methods
extension ListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.feedsTableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
        let feed = feeds[indexPath.row]
        if let imageUrl = feed.feedImageUrl {
            cell.feedImage.loadImage(withUrl: imageUrl)
        }
        cell.feedTitle.text = feed.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(feeds[indexPath.row])
    }
}
