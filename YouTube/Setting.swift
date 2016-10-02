//
//  Setting.swift
//  YouTube
//
//  Created by Ronald Hernandez on 10/1/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

class Setting: NSObject {
    
    let name: SettingName
    let image: String
    
    init(name: SettingName, image: String) {
        self.name = name
        self.image = image
    }
}

enum SettingName: String {
    
    case settings = "Settings"
    case termsPrivacy = "Terms & Privacy"
    case feedback = "Send Feedback"
    case help = "Help"
    case switchAcount = "Switch Account"
    case cancel = "Cancel"
}
