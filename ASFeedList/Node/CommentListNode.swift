//
//  CommentListNode.swift
//  ASFeedList
//
//  Created by Mango on 2019/9/8.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CommentListNode: ASDisplayNode {
    private let comments: [Comment]
    
    private var elements: [ASTextNode2] = []
    
    init(comments: [Comment]) {
        self.comments = comments
        super.init()
        automaticallyManagesSubnodes = true
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        cornerRadius = 3.0
        
        comments.forEach { comment in
            guard let attributedText = commentTextFor(comment: comment) else { return }
            let textNode = ASTextNode2()
            textNode.attributedText = attributedText
            elements.append(textNode)
        }
    }
    
    func commentTextFor(comment: Comment) -> NSAttributedString? {
        guard let userName = NSAttributedString.attributedString(string: comment.user?.nickname, fontSize: 13.0, color: .flatGreen, lineSpacing: 6.0) else { return nil }
        let separator = NSAttributedString.attributedString(string: ": ", fontSize: 13.0, color: .lightGray, lineSpacing: 6.0)!
        let content = NSAttributedString.attributedString(string: comment.content ?? "", fontSize: 13.0, color: .lightGray, lineSpacing: 6.0)!
        let attributedString = NSMutableAttributedString()

        attributedString.append(userName)
        attributedString.append(separator)
        attributedString.append(content)
        
        return attributedString
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let vStack = ASStackLayoutSpec.vertical()
        vStack.spacing = 6.0
        vStack.children = elements
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), child: vStack)
    }
}
