//
//  257-BinaryTreePaths.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉树，返回所有从根节点到叶子节点的路径。
 */
import Foundation

class BinaryTreePaths {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var results = [String]()
        
        if root == nil {
            return results
        }
        
        // 叶子结点
        if root?.left == nil && root?.right == nil {
            results.append(String(root!.val))
        }
        
        // 左子树的路径
        let leftPaths = self.binaryTreePaths(root?.left)
        for path in leftPaths {
            var newPath = String(root!.val)
            newPath.append(contentsOf: "->")
            newPath.append(contentsOf: path)
            results.append(newPath)
        }
        
        // 右子树的路径
        let rightPaths = self.binaryTreePaths(root?.right)
        for path in rightPaths {
            var newPath = String(root!.val)
            newPath.append(contentsOf: "->")
            newPath.append(contentsOf: path)
            results.append(newPath)
        }
    
        return results
    }
}
