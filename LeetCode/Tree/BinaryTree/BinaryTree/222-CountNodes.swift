//
//  222-CountNodes.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给出一个完全二叉树，求出该树的节点个数。
 
 思路一
    1 结点中有部分满二叉树，可以利用计算公式2^n - 1
 */
import Foundation

class CountNodes {
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        // 查看以该节点为root的左边高度
        var leftHeight = 0
        var node = root
        while node != nil {
            leftHeight += 1
            node = node?.left
        }
        
        // 查看以该节点为root的右边高度
        var rightHeight = 0
        node = root
        while node != nil {
            rightHeight += 1
            node = node?.right
        }
        
        // 左右相等，说明子树，是满二叉树
        if leftHeight == rightHeight {
            return (1 << leftHeight) - 1
        } else {
            return 1 + countNodes(root?.left) + countNodes(root?.right)
        }
    }
}
