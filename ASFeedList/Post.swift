//
//  Post.swift
//  ASFeedList
//
//  Created by Mango on 2019/7/10.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title: String?
    let content: String?
    let user: User?
    let image: [ImageEntity]?
}

struct User: Codable {
    let id: Int
    let nickname: String?
    let avatar: String?
    let introduction: String?
    let verified: String?
}

struct ImageEntity: Codable {
    var id: Int
    var thumb: String?
    var url: String?
    var original: String?
}
