import UIKit
import PlaygroundSupport
import AsyncDisplayKit

var str = "Hello, playground"

class LiveViewController: ASViewController<ASDisplayNode> {
    
    let customNode = CustomNode()
    
    init() {
        let displayNode = ASDisplayNode()
        super.init(node: displayNode)
        
        node.backgroundColor = .white
        node.addSubnode(customNode)
        node.layoutSpecBlock = { [weak self] (node, constrainedSize) in
            guard let self = self else { return ASLayoutSpec() }
            return ASCenterLayoutSpec(centeringOptions: .Y, sizingOptions: .minimumXY, child: self.customNode)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class CustomNode: ASDisplayNode, ASPlayground {
    
    lazy var shareButtonNode: ASButtonNode = {
        let shareButtonNode = ASButtonNode()
        shareButtonNode.setImage(#imageLiteral(resourceName: "share-icon"), for: .normal)
        return shareButtonNode
    }()
    
    lazy var commentButtonNode: ASButtonNode = {
        let commentButtonNode = ASButtonNode()
        commentButtonNode.setImage(#imageLiteral(resourceName: "like-icon"), for: .normal)
        return commentButtonNode
    }()
    
    lazy var likeButtonNode: ASButtonNode = {
        let likeButtonNode = ASButtonNode()
        likeButtonNode.setImage(#imageLiteral(resourceName: "like-icon"), for: .normal)
        return likeButtonNode
    }()
    
    let buttoNode = ASButtonNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let hStack = ASStackLayoutSpec.horizontal()
        hStack.justifyContent = .spaceAround
        hStack.children = [shareButtonNode, commentButtonNode, likeButtonNode]
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15), child: hStack)
    }
    
    func show() {
//        ASDisplayNode.display(inRect: CGRect(x: 0, y: 0, width: 190, height: 190))
        let rect = CGRect(x: 0, y: 0, width: 200, height: 200)
        display(in: rect)
    }
}


//PlaygroundPage.current.liveView = LiveViewController()
