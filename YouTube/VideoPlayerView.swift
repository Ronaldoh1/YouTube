
//
//  VideoPlayerView.swift
//  YouTube
//
//  Created by Ronald Hernandez on 10/15/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black
        let urlString = "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/HT1425/sample_iPod.m4v.zip"
        if let url = URL(string: urlString) {
        let player = AVPlayer(url: url)
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            
            playerLayer.frame = self.frame
            
            player.play()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
