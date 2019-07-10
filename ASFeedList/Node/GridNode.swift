//
//  GridNode.swift
//  ASFeedList
//
//  Created by Mango on 2019/7/10.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class GridNode: ASDisplayNode {
    
    var items: [ASImageNode] = []
    
    private let numberOfRow: CGFloat = 3

    init(imageCount: Int) {
        super.init()
        setItems(count: imageCount)
        backgroundColor = .lightGray
        automaticallyManagesSubnodes = true
    }
    
    func setItems(count: Int) {
        
        for _ in 0..<count {
            let imageNode = ASImageNode()
            imageNode.backgroundColor = .red
            imageNode.cornerRadius = 6.0
            items.append(imageNode)
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let spacing: CGFloat = 20.0
        
        let itemWidth = (constrainedSize.max.width - (numberOfRow - 1) * spacing) / numberOfRow
        items.forEach { $0.style.preferredSize = CGSize(width: itemWidth, height: itemWidth) }
        
        let hStack = ASStackLayoutSpec.horizontal()
        hStack.spacing = spacing
        hStack.lineSpacing = spacing
        hStack.flexWrap = .wrap
        hStack.children = items
        
        return hStack
    }
}
