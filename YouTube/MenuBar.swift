//
//  MenuBar.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/18/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UICollectionViewDataSource  {
    //Add all the customization in lazy loading
    lazy var collectionView:  UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
       cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["home", "trending", "subscriptions", "account"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        //add constraints to pin collectionView to each side
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31, alpha: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    //UICollectionView Data Source
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? MenuCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        return cell
    }
    
    //to specify the size of the cell 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    //Remove spacing between cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
