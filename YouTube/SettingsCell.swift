//
//  SettingsCell.swift
//  YouTube
//
//  Created by Ronald Hernandez on 10/1/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class SettingsCell: BaseCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        return label
    }()
    
    let iconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.blue
        
        addSubview(nameLabel)
        addSubview(iconImageView)
        
        addConstraintsWithFormat("H:|-8-[v0(30)]-8-[v1]|", views: iconImageView, nameLabel)
        addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat("V:|-8-[v0(30)]", views: iconImageView)
        
    }
}
