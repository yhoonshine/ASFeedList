//
//  Date+Extension.swift
//  ASFeedList
//
//  Created by Mango on 2019/7/8.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation

extension Date {
    func string(withFormat format: String = "MM-dd HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
