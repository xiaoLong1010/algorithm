//
//  235-BSTLowestCommonAncestor.swift
//  BinaryTree
//
//  Created by Csy on 2019/3/26.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。
 */

import Foundation

class BSTLowestCommonAncestor {
    func BSTLowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if !(root != nil && p != nil && q != nil) {
            return nil
        }
        
        let value1 = p!.val
        let value2 = q!.val
        let rootValue = root!.val
        
        // 两个结点小于root，那公共结点就在左边
        if rootValue > value1 && rootValue > value2  {
            return BSTLowestCommonAncestor(root?.left, p, q)
        }
        
        // 两个结点大于root，那公共结点就在右边
        if rootValue < value1 && rootValue < value2  {
            return BSTLowestCommonAncestor(root?.right, p, q)
        }
        
        return root
    }
}
