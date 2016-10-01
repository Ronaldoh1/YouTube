//
//  SettingsLauncher.swift
//  YouTube
//
//  Created by Ronald Hernandez on 10/1/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override init() {
         
    }
    
    func handleMore() {
        
        
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1.0
            })
        }
    }
    
    @objc private func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
    
}
