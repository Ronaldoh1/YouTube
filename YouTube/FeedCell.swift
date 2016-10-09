//
//  FeedCell.swift
//  YouTube
//
//  Created by Ronald Hernandez on 10/8/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    lazy var  collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var videos: [Video]?
    
    let cellID = "cellID"
    
    override func setupViews() {
        super.setupViews()
        
        //add collectionView to the subview
        addSubview(collectionView)
        
        // Add constraints
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        //register back the video cells.
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        
        //fetch videos
        fetchVideos()
    }
    
    // Helper methods
    
    private func fetchVideos() {
        APIService.sharedInstance.fetchVideos { (videos: [Video]) in
            self.videos = videos
            
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return videos?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! VideoCell
        
        cell.video = videos?[indexPath.item]
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
