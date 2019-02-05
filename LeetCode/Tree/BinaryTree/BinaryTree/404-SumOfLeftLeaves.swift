//
//  404-SumOfLeftLeaves.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/5.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 计算给定二叉树的所有左叶子之和。
 
 */

import Foundation

class SumOfLeftLeaves {
    
    func solution1(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        // 如果左边刚好是左叶子，那就加上右边
        if root?.left != nil && root?.left?.left == nil && root?.left?.right == nil {
            return (root?.left?.val)! + self.solution1(root?.right)
        } else {
            return self.solution1(root?.left) + self.solution1(root?.right)
        }
    }
}
