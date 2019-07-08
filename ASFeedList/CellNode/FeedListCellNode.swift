//
//  FeedListCellNode.swift
//  ASFeedList
//
//  Created by Lyrics on 2019/7/7.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class FeedListCellNode: ASCellNode {
    
    lazy var shareButtonNode: ASButtonNode = {
        let shareButtonNode = ASButtonNode()
        shareButtonNode.setImage(#imageLiteral(resourceName: "share-icon"), for: .normal)
        shareButtonNode.backgroundColor = .red
        shareButtonNode.style.preferredSize = CGSize(width: 50, height: 30)
        return shareButtonNode
    }()
    
    lazy var commentButtonNode: ASButtonNode = {
        let commentButtonNode = ASButtonNode()
        commentButtonNode.setImage(#imageLiteral(resourceName: "comment-icon"), for: .normal)
        commentButtonNode.backgroundColor = .green
        commentButtonNode.style.preferredSize = CGSize(width: 50, height: 30)
        return commentButtonNode
    }()
    
    lazy var likeButtonNode: ASButtonNode = {
        let likeButtonNode = ASButtonNode()
        likeButtonNode.setImage(#imageLiteral(resourceName: "like-icon"), for: .normal)
        likeButtonNode.backgroundColor = .yellow
        likeButtonNode.style.preferredSize = CGSize(width: 50, height: 30)
        return likeButtonNode
    }()
    
    lazy var moreButtonNode: ASButtonNode = {
        let moreButtonNode = ASButtonNode()
        moreButtonNode.setImage(#imageLiteral(resourceName: "more-icon"), for: .normal)
        moreButtonNode.backgroundColor = .gray
        return moreButtonNode
    }()
    
    lazy var titleNode: ASTextNode = {
        let titleNode = ASTextNode()
        titleNode.attributedText = NSAttributedString.attributedString(string: "Title", fontSize: 20, color: .black)
        return titleNode
    }()
    
    lazy var descriptionNode: ASTextNode = {
        let descriptionNode = ASTextNode()
        descriptionNode.attributedText = NSAttributedString.attributedString(string: "DescriptionNode", fontSize: 20, color: .black)
        return descriptionNode
    }()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        let vStack = ASStackLayoutSpec.vertical()
//        vStack.alignItems = .start
//        vStack.spacing = 10
//        vStack.children = [titleNode, descriptionNode]
//        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15), child: vStack)
//    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let hStack = ASStackLayoutSpec.horizontal()
        hStack.spacing = 20
        hStack.children = [shareButtonNode, commentButtonNode, likeButtonNode]
        
        let hButtonNodeStack = ASStackLayoutSpec.horizontal()
        hButtonNodeStack.justifyContent = .spaceBetween
        hButtonNodeStack.children = [hStack, moreButtonNode]
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15), child: hButtonNodeStack)
    }
}
