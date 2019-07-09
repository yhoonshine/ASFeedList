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
    
    lazy var avatarImageNode: ASImageNode = {
       let avatarImageNode = ASImageNode()
        avatarImageNode.cornerRadius = appearance.avatarSize.width / 2.0
        avatarImageNode.backgroundColor = .red
        avatarImageNode.style.preferredSize = appearance.avatarSize
        return avatarImageNode
    }()
    
    lazy var nameTextNode: ASTextNode = {
        let nameTextNode = ASTextNode()
        nameTextNode.backgroundColor = .red
        nameTextNode.attributedText = NSAttributedString.attributedString(string: "大魔王尼古拉", fontSize: 13.0, color: .black)
        return nameTextNode
    }()
    
    lazy var introTextNode: ASTextNode = {
        let introTextNode = ASTextNode()
        introTextNode.backgroundColor = .green
        introTextNode.attributedText = NSAttributedString.attributedString(string: "网易云音乐主持人", fontSize: 11.0, color: .lightGray)
        return introTextNode
    }()
    
    lazy var dateTextNode: ASTextNode = {
        let dateTextNode = ASTextNode()
        dateTextNode.attributedText = NSAttributedString.attributedString(string: "09:23", fontSize: 11.0, color: .lightGray)
        return dateTextNode
    }()
    
    lazy var tagButtonNode: ASButtonNode = {
        let tagButtonNode = ASButtonNode()
        tagButtonNode.setTitle("江湖注定不会太平，江湖最难揣度的啊", with: UIFont.systemFont(ofSize: 13.0), with: .black, for: .normal)
        tagButtonNode.contentEdgeInsets = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        tagButtonNode.setImage(#imageLiteral(resourceName: "tag-icon"), for: .normal)
        tagButtonNode.backgroundColor = appearance.mainColor.withAlphaComponent(0.05)
        return tagButtonNode
    }()
    
    lazy var shareButtonNode: ASButtonNode = {
        let shareButtonNode = ASButtonNode()
        shareButtonNode.setImage(#imageLiteral(resourceName: "share-icon"), for: .normal)
        shareButtonNode.backgroundColor = .red
        shareButtonNode.style.preferredSize = appearance.toolbarItemSize
        return shareButtonNode
    }()
    
    lazy var commentButtonNode: ASButtonNode = {
        let commentButtonNode = ASButtonNode()
        commentButtonNode.setImage(#imageLiteral(resourceName: "comment-icon"), for: .normal)
        commentButtonNode.backgroundColor = .green
        commentButtonNode.style.preferredSize = appearance.toolbarItemSize
        return commentButtonNode
    }()
    
    lazy var likeButtonNode: ASButtonNode = {
        let likeButtonNode = ASButtonNode()
        likeButtonNode.setImage(#imageLiteral(resourceName: "like-icon"), for: .normal)
        likeButtonNode.backgroundColor = .yellow
        likeButtonNode.style.preferredSize = appearance.toolbarItemSize
        return likeButtonNode
    }()
    
    lazy var moreButtonNode: ASButtonNode = {
        let moreButtonNode = ASButtonNode()
        moreButtonNode.setImage(#imageLiteral(resourceName: "more-icon"), for: .normal)
        moreButtonNode.backgroundColor = .gray
        moreButtonNode.style.preferredSize = appearance.toolbarItemSize
        return moreButtonNode
    }()
    
    lazy var titleNode: ASTextNode = {
        let titleNode = ASTextNode()
        titleNode.attributedText = NSAttributedString.attributedString(string: "您的手机桌面是否需要一款硬核游戏？steam中 爆火的《只狼》大作", fontSize: 16, color: .black)
        return titleNode
    }()
    
    lazy var contentTextNode: ASTextNode = {
        let contentTextNode = ASTextNode()
        contentTextNode.attributedText = NSAttributedString.attributedString(string: "这是以人气动漫《进击的巨人》为题材的驱逐模拟战略RPG。收录了30名以上角色。建模及剧情等还原度极高，代入感佳，全语音支持。战", fontSize: 15, color: .lightGray)
        return contentTextNode
    }()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        makePictrueArray()
    }
    
    var pictrueArray: [ASImageNode] = []
    
    func makePictrueArray() {
        for _ in 0...6 {
            let imageNode = ASImageNode()
            imageNode.backgroundColor = .red
            imageNode.style.preferredSize = CGSize(width: 100, height: 100)
            pictrueArray.append(imageNode)
        }
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let toolbarStack = layoutToolbarSpec()
        let contentStack = layoutContentSpec()
        let userInfoSpec = layoutUserInfoSpec()
        let pictures = layoutPictureSpec()
        
        tagButtonNode.style.alignSelf = .start
        
        let vStack = ASStackLayoutSpec.vertical()
        vStack.spacing = 10.0
        vStack.children = [userInfoSpec, tagButtonNode, contentStack, toolbarStack, pictures]
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15), child: vStack)
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
        nameAndIntroSpec.children = [nameTextNode, introTextNode]
        nameAndIntroSpec.style.flexGrow = 1.0
        
        let hStack = ASStackLayoutSpec.horizontal()
        hStack.spacing = 10.0
        hStack.alignItems = .center
        hStack.children = [avatarImageNode, nameAndIntroSpec, dateTextNode]
        
        return hStack
    }
    
    func layoutContentSpec() -> ASLayoutSpec {
        let hStack = ASStackLayoutSpec.vertical()
        hStack.spacing = 10.0
        hStack.children = [titleNode, contentTextNode]
        
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
    
    func layoutPictureSpec() -> ASLayoutSpec {
        let hStack = ASStackLayoutSpec.horizontal()
        hStack.children = pictrueArray
        hStack.spacing = 20
        hStack.lineSpacing = 20
        hStack.flexWrap = .wrap
        return hStack
    }
}

private extension FeedListCellNode {
    struct Appearance {
        let avatarSize = CGSize(width: 35.0, height: 35.0)
        
        let toolbarItemSize = CGSize(width: 50, height: 30)
        
        let mainColor = UIColor(displayP3Red: 0.05, green: 0.79, blue: 0.46, alpha: 1.0)
    }
}
