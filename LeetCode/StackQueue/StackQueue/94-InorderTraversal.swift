//
//  94-InorderTraversal.swift
//  StackQueue
//
//  Created by Csy on 2019/2/14.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

enum Action {
    case next
    case print
}

class NodeWrapper {
    var node: TreeNode
    var action: Action
    
    init(_ aNode: TreeNode, _ act: Action) {
        self.node = aNode
        self.action = act
    }
}

class InorderTraversal {
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
                // 入栈：右，中，左
                // 出栈：左，中，右
                if aNodeWrapper.node.right != nil {
                    stack.append(NodeWrapper(aNodeWrapper.node.right!, Action.next))
                }
                
                stack.append(NodeWrapper(aNodeWrapper.node,Action.print))
                
                if aNodeWrapper.node.left != nil {
                    stack.append(NodeWrapper(aNodeWrapper.node.left!, Action.next))
                }
            }
        }
        
        return results
    }
    
    func solution2(_ root: TreeNode?) -> [Int] {
        var results = [Int]()
        var stack = [TreeNode]()
        var currentNode = root
        
        while currentNode != nil || !stack.isEmpty {
            if currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            } else {
                currentNode = stack.removeLast()
                results.append(currentNode!.val)
                currentNode = currentNode?.right
            }
        }
        
        return results
    }
}
