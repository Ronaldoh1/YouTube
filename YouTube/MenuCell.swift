//
//  MenuCell.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/18/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "")
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.yellow
    }
    
  
}
