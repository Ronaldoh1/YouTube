//
//  Video.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/24/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var uploadDate: Date?
    
    var channel: Channel?
    
    var duration: NSNumber?
    
    override func setValue(_ value: Any?, forKey key: String) {
//        let upperCassedFirstCharacter = String(key.characters.first!).uppercased()
//        let range = key.startIndex...key.startIndex
//        let selectorString = key.replacingCharacters(in: range, with: upperCassedFirstCharacter)
//        let selector = NSSelectorFromString("set\(selectorString)")
//        let responds = self.responds(to: selector)
//        
//        if !responds {
//            return
//        }
//        
        if key == "channel" {
            
            let channelDictionary = value as? [String : AnyObject]
            
            let channel = Channel()
            
            channel.setValuesForKeys(channelDictionary!)
        
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    init(dictionary: [String : AnyObject]) {
       super.init()
        setValuesForKeys(dictionary)
    }
    
}
