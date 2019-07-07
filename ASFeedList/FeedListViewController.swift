//
//  FeedListViewController.swift
//  ASFeedList
//
//  Created by Lyrics on 2019/7/7.
//  Copyright © 2019 Albatross Lab. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class FeedListViewController: ASViewController <ASTableNode> {
    
    init() {
        let tableNode = ASTableNode(style: .plain)
        
        super.init(node: tableNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        node.dataSource = self
        node.delegate = self
    }

}

extension FeedListViewController: ASTableDataSource {
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return FeedListCellNode()
    }
}

extension FeedListViewController: ASTableDelegate {
    
}
