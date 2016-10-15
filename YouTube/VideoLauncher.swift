//
//  VideoLauncher.swift
//  YouTube
//
//  Created by Ronald Hernandez on 10/9/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class VideoLauncher: NSObject {

    func showVideoPlayer() {
        print("showing video player")
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.white
            
            // set begining frame
            view.frame = CGRect(x: Int(keyWindow.frame.width - 10), y: Int(keyWindow.frame.height - 10), width: 10, height: 10)
            
            
            let height = keyWindow.frame.width * 9/15
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            
            view.addSubview(videoPlayerView)
            
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = keyWindow.frame
                }, completion: { (completedAnimation) in
                    // will do something here later
                    
                    UIApplication.shared.isStatusBarHidden = true 
            })
        }
        
        
    }
}
