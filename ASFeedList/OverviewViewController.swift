//
//  OverviewViewController.swift
//  ASFeedList
//
//  Created by Lyrics on 2019/7/7.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class OverviewViewController: ASViewController<ASDisplayNode> {
    
    lazy var textNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.attributedText = NSAttributedString.attributedString(string: "Title", fontSize: 13, color: .black)
        textNode.backgroundColor = .lightGray
        return textNode
    }()
    
    // MARK: -
    
    init() {
        let displayNode = ASDisplayNode()
        
        super.init(node: displayNode)
        displayNode.automaticallyManagesSubnodes = true
        node.layoutSpecBlock = { [weak self] (node, constrainedSize) in
            guard let self = self else { return ASLayoutSpec() }
            return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: self.textNode)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}
