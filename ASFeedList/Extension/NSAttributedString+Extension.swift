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
    
    static func attributedString(string: String?, font: UIFont, color: UIColor = .black, lineSpacing: CGFloat? = nil) -> NSAttributedString? {
        guard let string = string else { return nil }
        
        var attributes: [NSAttributedString.Key : Any] = [.foregroundColor: color, .font: font]
        if let lineSpacing = lineSpacing {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            attributes[.paragraphStyle] = paragraphStyle
        }
        
        let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
        return attributedString
    }
    
    static func attributedString(string: String?, fontSize size: CGFloat, color: UIColor = .black, lineSpacing: CGFloat? = nil) -> NSAttributedString? {
        let font = UIFont.systemFont(ofSize: size)
        let attributedString = NSAttributedString.attributedString(string: string, font: font, color: color, lineSpacing: lineSpacing)
        
        return attributedString
    }
    
}
