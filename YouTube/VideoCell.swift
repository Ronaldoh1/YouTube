//
//  VideoCell.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    func setupSubViews() {
        backgroundColor = UIColor.red
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat("V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView, separatorView)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
