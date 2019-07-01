//
//  TrendingCell.swift
//  YoutubeClone
//
//  Created by Omar Thamri on 01/07/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchFeedUrlString(urlString: "http://localhost/trending.json") { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

}
