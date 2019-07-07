//
//  NSAttributedString+Extension.swift
//  ASFeedList
//
//  Created by Lyrics on 2019/7/7.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    static func attributedString(string: String?, fontSize size: CGFloat, color: UIColor?) -> NSAttributedString? {
        guard let string = string else { return nil }
        
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: color ?? UIColor.black,
                                                          .font: UIFont.boldSystemFont(ofSize: size)]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
        
        return attributedString
    }
    
}
