//
//  145-PostorderTraversal.swift
//  StackQueue
//
//  Created by Csy on 2019/2/14.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class PostorderTraversal {
    func solution1(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var results = [Int]()
        var stack = [NodeWrapper]()
        
        stack.append(NodeWrapper(root!,Action.next))
        while !stack.isEmpty {
            let aNodeWrapper = stack.removeLast()
            
            if aNodeWrapper.action == Action.print {
                results.append(aNodeWrapper.node.val)
            } else {
                // 入栈：中，右，左
                // 出栈：左，右，中
                stack.append(NodeWrapper(aNodeWrapper.node,Action.print))
                
                if aNodeWrapper.node.right != nil {
                    stack.append(NodeWrapper(aNodeWrapper.node.right!,Action.next))
                }
                
                if aNodeWrapper.node.left != nil {
                    stack.append(NodeWrapper(aNodeWrapper.node.left!,Action.next))
                }
            }
        }
        
        return results
    }
}
