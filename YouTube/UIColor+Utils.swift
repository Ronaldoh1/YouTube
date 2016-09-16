//
//  UIColor+Utils.swift
//  YouTube
//
//  Created by Ronald Hernandez on 9/16/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
