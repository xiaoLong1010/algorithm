//
//  main.swift
//  HasSubtree
//
//  Created by Csy on 2018/11/18.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ val: Int) {
        self.value = val
        self.left = nil
        self.right = nil
    }
}

func hasSubtree(_ root1: BinaryTreeNode?, _ root2: BinaryTreeNode?) -> Bool {
    var result = false
    
    if root1 != nil && root2 != nil {
        // 从该node开始，是否和root2相同
        result = tree(fromNode: root1, hasSub: root2);
        
        // 
        if !result {
            result = hasSubtree(root1?.left, root2) ||
                     hasSubtree(root1?.right, root2)
        }
    }
    
    return result
}

func tree(fromNode node1: BinaryTreeNode?, hasSub node2: BinaryTreeNode?) -> Bool {
    if node1 == nil {
        return false
    }
    
    if node2 == nil {
        return true
    }
    
    if node1?.value != node2!.value {
        return false
    }
    
    return tree(fromNode: node1?.left, hasSub: node2?.left) &&
    tree(fromNode: node1?.right, hasSub: node2?.right)
}




