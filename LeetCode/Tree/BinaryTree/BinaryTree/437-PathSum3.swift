//
//  437-PathSum3.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉树，它的每个结点都存放着一个整数值。
 找出路径和等于给定数值的路径总数。
 
 路径不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。
 二叉树不超过1000个节点，且节点数值范围是 [-1000000,1000000] 的整数。
 */

import Foundation

class PathSum3 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        if root == nil {
            return 0
        }
        
        return self.pathSumOfNode(root, sum) + self.pathSum(root?.left ,sum) + self.pathSum(root?.right ,sum)
    }
    
    func pathSum2(_ root: TreeNode?, _ sum: Int) -> Int {
        if root == nil {
            return 0
        }
        
        var count = 0
        var stack = [root!]
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            count += self.pathSumOfNode(node, sum)
            
            if let aNode = node.left {
                stack.append(aNode)
            }
            
            if let aNode = node.right {
                stack.append(aNode)
            }
        }
        
        return count
    }
    
    // 以node为起点的path sum
    func pathSumOfNode(_ node: TreeNode?, _ sum: Int) -> Int {
        if node == nil {
            return 0
        }
        
        var count = 0
        if node!.val == sum {
            count += 1
        }
        
        // node加子节点，也可能加起来的等于sum，因为有s负数
        count += pathSumOfNode(node?.left, (sum - node!.val))
        count += pathSumOfNode(node?.right, (sum - node!.val))
        
        return count
    }
}
