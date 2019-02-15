//
//  104-MaxDepth.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉树，找出其最大深度。
 */

import Foundation

class MaxDepth {
    func solution1(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftDepth = solution1(root?.left)
        let rightDepth = solution1(root?.right)
        
        let maxValue = max(leftDepth, rightDepth)
        return 1 + maxValue
    }
}

