//
//  GridImageNode.swift
//  ASFeedList
//
//  Created by Mango on 2019/7/10.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class GridImageNode: ASDisplayNode {
    var items: [ASNetworkImageNode] = []
    
    private let numberOfRow: CGFloat = 3
    
    init(imageURLs: [URL], maxCount: Int = 9) {
        super.init()
        setupItems(with: imageURLs, maxCount: maxCount)
        backgroundColor = .lightGray
        automaticallyManagesSubnodes = true
    }
    
    func setupItems(with imageURLs: [URL], maxCount: Int) {
        imageURLs
            .prefix(maxCount)
            .forEach { url in
                let imageNode = ASNetworkImageNode()
                imageNode.backgroundColor = .red
                imageNode.cornerRadius = 6.0
                imageNode.url = url
                items.append(imageNode)
            }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let spacing: CGFloat = 10.0
        
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
