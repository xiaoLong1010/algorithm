//
//  98-IsValidBST.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/16.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 */

import Foundation

class IsValidBST {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return self.validBSTCore(root, Int.min, Int.max)
    }
    
    func validBSTCore(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        if root == nil {
            return true
        }
        
        let rootValue = root!.val
        
        if rootValue <= min || rootValue >= max  {
            return false
        }
        
        return self.validBSTCore(root?.left, min, rootValue) && self.validBSTCore(root?.right, rootValue, max)
    }
    
    // 判断以root的树，是否是二叉搜索树，并且返回这个搜索树的最大值node
    // 错误代码，不能达到要求
    func validBSTCore2(_ root: TreeNode?) -> (isValid: Bool, maxNode: TreeNode?) {
        if root == nil {
            return (true, nil)
        }
        
        let rootValue = root!.val
        
        // 比较root和左子树
        let (isLeftValid, leftMaxNode) = self.validBSTCore2(root?.left)
        if !isLeftValid {
            return (false, nil)
        }
        if let leftNode = leftMaxNode {
            if leftNode.val >= rootValue {
                return (false, nil)
            }
        }
        
        // 比较root和左子树
        let (isRightValid, rightMaxNode) = self.validBSTCore2(root?.right)
        if !isRightValid {
            return (false, nil)
        }
        if let rightNode = rightMaxNode {
            if rightNode.val <= rootValue {
                return (false, nil)
            }
            
            // 右子树符合要求，那就直接返回
            return (true, rightNode)
        }
        
        return (true, root)
    }
}
