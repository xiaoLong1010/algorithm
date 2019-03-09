//
//  110-IsBalanced.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 一棵高度平衡二叉树定义为：
    一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
 */

import Foundation
class IsBalanced {
    func isBalanced(_ root: TreeNode?) -> Bool {
        var isBalance = true
        _ = self.isBalanceCore(root, &isBalance)
        
        return isBalance
    }
    
    func isBalanceCore(_ root: TreeNode?, _ isBalance: inout Bool) -> Int {
        if root == nil {
            return 0
        }
        
        if !isBalance {
            return 0
        }
    
        let leftDepth = isBalanceCore(root?.left, &isBalance)
        let rightDepth = isBalanceCore(root?.right, &isBalance)
        
        if abs(leftDepth - rightDepth) > 1 {
            isBalance = false
        }
        
        return 1 + max(leftDepth, rightDepth)
    }
}
