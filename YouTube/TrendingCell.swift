//
//  TrendingCell.swift
//  YouTube
//
//  Created by Ronald Hernandez on 10/9/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        APIService.sharedInstance.fetchTrendingVideos { (videos: [Video]) in
            self.videos = videos
            
            self.collectionView.reloadData()
        }
    }
}
