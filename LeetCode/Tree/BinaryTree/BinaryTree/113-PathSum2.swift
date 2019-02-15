//
//  113-PathSum2.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。
 给定如下二叉树，以及目标和 sum = 22
 5
 / \
 4   8
 /   / \
 11  13  4
 /  \    / \
 7    2  5   1
 
 结果
 [
 [5,4,11,2],
 [5,8,4,5]
 ]
 */
import Foundation

class PathSum2 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var results = [[Int]]()
        
        if root == nil {
            return results
        }
        
        let rootVal = root!.val
        
        // 如果是叶子结点
        if root?.left == nil && root?.right == nil {
            if rootVal == sum {
                results.append([sum])
            }
            return results
        }
        
        // 左边的结果
        let leftResults = self.pathSum(root?.left, sum - rootVal)
        for var aResult in leftResults {
            aResult.insert(rootVal, at: 0)
            results.append(aResult)
        }
        
        // 右边的结果
        let rightResults = self.pathSum(root?.right, sum - rootVal)
        for var aResult in rightResults {
            aResult.insert(rootVal, at: 0)
            results.append(aResult)
        }
    
        return results
    }
}
