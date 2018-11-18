//
//  main.swift
//  SymmetricalBinaryTree
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

func isSymmetrical(_ root1: BinaryTreeNode?, _ root2: BinaryTreeNode?) -> Bool {
    if root1 == nil && root2 == nil {
        return true
    }
    
    // 一个是nil，一个不是nil
    if root1 == nil || root2 == nil {
        return false
    }
    
    // 都不是nil，就比较value
    if root1?.value != root2?.value {
        return false
    }
    
    return isSymmetrical(root1?.left, root2?.right) &&
            isSymmetrical(root1?.right, root2?.left)
}

