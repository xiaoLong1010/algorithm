//
//  112-HasPathSum.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
 
 */

import Foundation

class HasPathSum {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }
        
        // 如果是叶子结点，值必须等于sum
        if root!.left == nil && root!.right == nil {
            return root!.val == sum
        }
        
        return hasPathSum(root?.left, sum - root!.val) ||
            hasPathSum(root?.right, sum - root!.val)
    }
}
