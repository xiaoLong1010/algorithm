//
//  111-MinDepth.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉树，找出其最小深度。
 */
import Foundation

class MinDepth {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftCount = minDepth(root?.left)
        let rightCount = minDepth(root?.right)
        
        // 1 当前结点是叶子结点
        // 2 当前结点只有一个子结点
        if leftCount == 0 || rightCount == 0 {
            return 1 + leftCount + rightCount
        } else {        // 当前不是叶子结点
            let minValue = min(leftCount, rightCount)
            return 1 + minValue
        }
    }
}
