//
//  UIView+Extension.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/11/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        //create the dictionary of views
        var viewsDictionary = [String : UIView]()
        //add views to the dictionary
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        // add constraints using the viewsDictionary that was constructed 
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options:NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}
