//
//  226-InvertTree.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 翻转一棵二叉树。
 */

import Foundation

class InvertTree {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        // 先反转左子树和右子树
        _ = self.invertTree(root?.left)
        _ = self.invertTree(root?.right)
        
        // 再反转当前结点的左右子结点
        (root!.left, root!.right) = (root!.right, root!.left)
        
        return root
    }
}
