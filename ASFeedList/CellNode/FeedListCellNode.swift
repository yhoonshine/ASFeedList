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
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let vStack = ASStackLayoutSpec.vertical()
        vStack.alignItems = .start
        vStack.spacing = 10
        vStack.children = [titleNode, descriptionNode]
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15), child: vStack)
    }
}
