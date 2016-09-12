//
//  HomeViewController.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }

    // MARK: UICollectionView Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
      
        return cell
    }
    
    //Eliminate extra spacing you have at the bottom of each cell. 
    @objc(collectionView:layout:minimumLineSpacingForSectionAtIndex:) func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //we know what the width is, but need to figure out the height 
        //we can get the with of the thumnail image by using the view of the cell and subracting -16 from each side and then we multiply it by 9/ 16 ratio
        let height = (view.frame.width - 16 - 16) * 9 / 16 // we subtract the spacing from the left and right for the with. And then multiply by 9/16 ratio (this is the ratio for video) 
        
        //The 68 below comes from all the spacing that we've addded in order to layout everything vertically. So 8 + 44 + 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
}

