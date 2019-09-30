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
    
    private let appearance = Appearance()
    
    private let post: Post
    
    lazy var avatarImageNode: ASNetworkImageNode = {
       let avatarImageNode = ASNetworkImageNode()
        avatarImageNode.cornerRadius = appearance.avatarSize.width / 2.0
//        avatarImageNode.backgroundColor = .red
        avatarImageNode.url = self.post.user?.avatar
        avatarImageNode.style.preferredSize = appearance.avatarSize
        return avatarImageNode
    }()
    
    lazy var nameTextNode: ASTextNode = {
        let nameTextNode = ASTextNode()
//        nameTextNode.backgroundColor = .red
        let name = post.user?.nickname ?? ""
        nameTextNode.attributedText = NSAttributedString.attributedString(string: name, fontSize: 13.0, color: .black)
        return nameTextNode
    }()
    
    lazy var introTextNode: ASTextNode = {
        let introTextNode = ASTextNode()
//        introTextNode.backgroundColor = .green
        return introTextNode
    }()
    
    lazy var dateTextNode: ASTextNode = {
        let dateTextNode = ASTextNode()
        dateTextNode.attributedText = NSAttributedString.attributedString(string: "09:23", fontSize: 11.0, color: .lightGray)
        return dateTextNode
    }()
    
    lazy var tagButtonNode: ASButtonNode = {
        let tagButtonNode = ASButtonNode()
        tagButtonNode.contentEdgeInsets = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        tagButtonNode.setImage(#imageLiteral(resourceName: "tag-icon"), for: .normal)
        tagButtonNode.backgroundColor = appearance.mainColor.withAlphaComponent(0.05)
        tagButtonNode.style.alignSelf = .start
        return tagButtonNode
    }()
    
    lazy var shareButtonNode: ASButtonNode = {
        let shareButtonNode = ASButtonNode()
        shareButtonNode.setImage(#imageLiteral(resourceName: "share-icon"), for: .normal)
//        shareButtonNode.backgroundColor = .red
        shareButtonNode.style.preferredSize = appearance.toolbarItemSize
        return shareButtonNode
    }()
    
    lazy var commentButtonNode: ASButtonNode = {
        let commentButtonNode = ASButtonNode()
        commentButtonNode.setImage(#imageLiteral(resourceName: "comment-icon"), for: .normal)
//        commentButtonNode.backgroundColor = .green
        commentButtonNode.style.preferredSize = appearance.toolbarItemSize
        return commentButtonNode
    }()
    
    lazy var likeButtonNode: ASButtonNode = {
        let likeButtonNode = ASButtonNode()
        likeButtonNode.setImage(#imageLiteral(resourceName: "like-icon"), for: .normal)
//        likeButtonNode.backgroundColor = .yellow
        likeButtonNode.style.preferredSize = appearance.toolbarItemSize
        return likeButtonNode
    }()
    
    lazy var moreButtonNode: ASButtonNode = {
        let moreButtonNode = ASButtonNode()
        moreButtonNode.setImage(#imageLiteral(resourceName: "more-icon"), for: .normal)
//        moreButtonNode.backgroundColor = .gray
        moreButtonNode.style.preferredSize = appearance.toolbarItemSize
        return moreButtonNode
    }()
    
    lazy var titleNode: ASTextNode = {
        let titleNode = ASTextNode()
        return titleNode
    }()
    
    lazy var contentTextNode: ASTextNode = {
        let contentTextNode = ASTextNode()
        return contentTextNode
    }()
    
    lazy var gridNode: GridImageNode = {
        let images = self.post.images ?? []
        let gridNode = GridImageNode(imageURLs: images.map { $0.url! } )
        return gridNode
    }()
    
    // MARK: -
    
    init(post: Post) {
        self.post = post
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var children: [ASLayoutElement] = []
        
        let userInfoSpec = layoutUserInfoSpec()
        children.append(userInfoSpec)
        
        if let tag = post.intro, !tag.isEmpty {
            tagButtonNode.setTitle(tag, with: UIFont.systemFont(ofSize: 13.0), with: .black, for: .normal)
            children.append(tagButtonNode)
        }
        
        if let contentStack = layoutContentSpec() {
            children.append(contentStack)
        }
        
        children.append(gridNode)
        
        let toolbarStack = layoutToolbarSpec()
        children.append(toolbarStack)
        
        let vStack = ASStackLayoutSpec.vertical()
        vStack.spacing = 10.0
        vStack.children = children
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0), child: vStack)
    }
    
    override func layout() {
        super.layout()
        tagButtonNode.cornerRadius = tagButtonNode.bounds.height / 2
    }
}


// MARK: - Layout subnode
//
private extension FeedListCellNode {
    
    func layoutUserInfoSpec() -> ASLayoutSpec {
        let nameAndIntroSpec = ASStackLayoutSpec.vertical()
        nameAndIntroSpec.spacing = 6.0
        nameAndIntroSpec.style.flexGrow = 1.0
        nameAndIntroSpec.children = [nameTextNode]
        
        if let intro = post.user?.introduction, !intro.isEmpty {
            introTextNode.attributedText = NSAttributedString.attributedString(string: intro, fontSize: 11.0, color: .lightGray)
            nameAndIntroSpec.children?.append(introTextNode)
        }
        
        let hStack = ASStackLayoutSpec.horizontal()
        hStack.spacing = 10.0
        hStack.alignItems = .center
        hStack.children = [avatarImageNode, nameAndIntroSpec, dateTextNode]
        
        return hStack
    }
    
    func layoutContentSpec() -> ASLayoutSpec? {
        var elements: [ASLayoutElement] = []
        
        if let title = post.title, !title.isEmpty {
            titleNode.attributedText = NSAttributedString.attributedString(string: title, fontSize: 16, color: .black)
            elements.append(titleNode)
        }
        
        if let contentText = post.content, !contentText.isEmpty {
            contentTextNode.attributedText = NSAttributedString.attributedString(string: contentText, fontSize: 15, color: .lightGray)
            elements.append(contentTextNode)
        }
        
        guard !elements.isEmpty else { return nil }
        
        let hStack = ASStackLayoutSpec.vertical()
        hStack.spacing = 10.0
        hStack.children = elements
        return hStack
    }
    
    func layoutToolbarSpec() -> ASLayoutSpec {
        let hStack = ASStackLayoutSpec.horizontal()
        hStack.spacing = 20
        hStack.children = [shareButtonNode, commentButtonNode, likeButtonNode]
        
        let toolbarStack = ASStackLayoutSpec.horizontal()
        toolbarStack.justifyContent = .spaceBetween
        toolbarStack.children = [hStack, moreButtonNode]
        
        return toolbarStack
    }
}

private extension FeedListCellNode {
    struct Appearance {
        let avatarSize = CGSize(width: 35.0, height: 35.0)
        
        let toolbarItemSize = CGSize(width: 50, height: 30)
        
        let mainColor = UIColor(displayP3Red: 0.05, green: 0.79, blue: 0.46, alpha: 1.0)
    }
}
