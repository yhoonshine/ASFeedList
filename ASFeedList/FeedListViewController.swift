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
    
    var postList: [Post] = []
    
    init() {
        let tableNode = ASTableNode(style: .plain)
        
        super.init(node: tableNode)
        
//        ASDisplayNode.shouldShowRangeDebugOverlay = true
//        l = generateFeedList(with: "FeedList", type: Post.self)
        
        let feedlist = generateFeedList(with: "FeedList", type: Post.self)
        postList += feedlist
        postList += feedlist
        postList += feedlist
        postList += feedlist
        postList += feedlist

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
        return postList.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return FeedListCellNode()
    }
    
}

extension FeedListViewController: ASTableDelegate {
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
    }
}

extension FeedListViewController {
    func generateFeedList<T: Codable>(with filename: String, type: T.Type) -> [T] {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else {
            fatalError("Can not find file path from \(filename)")
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let list = try JSONDecoder().decode([T].self, from: data)
            return list

        } catch {
            print("decode error")
            print(error.localizedDescription)
        }
        
        return []
    }
}
