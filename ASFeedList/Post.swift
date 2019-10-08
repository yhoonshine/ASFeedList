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
    let intro: String?
    let images: [ImageEntity]?
    let challenge: Challenge?
    let replies: [Comment]?
    let createTime: Date?
}

struct User: Codable {
    let id: Int
    let nickname: String?
    let avatar: URL?
    let introduction: String?
    let verified: String?
}

struct ImageEntity: Codable {
    let thumb: String?
    let url: URL?
    let original: String?
}

struct Challenge: Codable {
    let id: Int?
    let title: String?
}

struct Comment: Codable {
        let id: Int
    let content: String?
    var images: [ImageEntity]?
    var user: User?
}
