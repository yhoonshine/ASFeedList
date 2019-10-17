//
//  UIColor+Extension.swift
//  ASFeedList
//
//  Created by Mango on 2019/9/8.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static var flatGreen: UIColor {
        return UIColor(red: 0.35, green: 0.7, blue: 0.54, alpha: 1)
    }
    
    static var subTitle: UIColor {
        return UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha:1)
    }
    
    static var random: UIColor {
        let red = UInt(arc4random_uniform(255))
        let green = UInt(arc4random_uniform(255))
        let blue = UInt(arc4random_uniform(255))
        return UIColor(byteRed: red, green: green, blue: blue)
    }
    
    convenience init(byteRed red: UInt, green: UInt, blue: UInt, alpha: Float = 1) {
        let red = min(red, 255)
        let green = min(green, 255)
        let blue = min(blue, 255)
        
        var alpha = alpha
        if alpha < 0 { alpha = 0 }
        if alpha > 1 { alpha = 1 }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    }
}
