//
//  236-LowestCommonAncestor.swift
//  BinaryTree
//
//  Created by Csy on 2019/3/26.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 普通的二叉树，求其公共祖先
 思路1
    1 以每一个结点为root，进行层次遍历，看是否包含这两个结点
    2 最终找到公共祖先
    3 时间复杂度o(n^2)，空间复杂度
    4 为了保证代码统一，可以使用虚拟根结点
 思路2
    1 进行深度遍历，找到root到结点1的路径，root到结点2的路径
    2 相当于公共结点的链表
 */

import Foundation

class LowestCommonAncestor {
    func lowestCommonAncestor1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if !(root != nil && p != nil && q != nil) {
            return nil
        }
        // 使用虚拟根结点，保证统一
        let dummyRoot: TreeNode? = TreeNode(-1)
        dummyRoot?.left = root
        
        var resultNode = dummyRoot
        while true {
            if self.contain(resultNode?.left, p, q)  {
                resultNode = resultNode?.left
                continue
            }
            if self.contain(resultNode?.right, p, q)  {
                resultNode = resultNode?.right
                continue
            }
            // 都不包含两个结点
            break
        }
        return resultNode
    }
    
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if !(root != nil && p != nil && q != nil) {
            return nil
        }
        
        var nodes1 = [TreeNode?]()
        var nodes2 = [TreeNode?]()
        
        _ = self.path(from: root, to: p, &nodes1)
        _ = self.path(from: root, to: q, &nodes2)
        
        var resultNode: TreeNode? = nil
        let length = min(nodes1.count, nodes2.count)
        for i in 0..<length {
            if nodes1[i] === nodes2[i] {
                resultNode = nodes1[i]
            } else {
                break
            }
        }
        return resultNode
    }
    
    func lowestCommonAncestor3(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if !(root != nil && p != nil && q != nil) {
            return nil
        }
        
        if root === p || root === q {
            return root
        }
        
        let left = self.lowestCommonAncestor3(root?.left, p, q)
        let right = self.lowestCommonAncestor3(root?.right, p, q)
        
        if left != nil && right != nil {        // p 和 q在左右子树
            return root
        } else if left != nil {
            return left
        } else {
            return right
        }
    }
    
    // root为根的树，是否包含p和q两个结点
    func contain(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if root == nil {
            return false
        }
        
        var queue = [TreeNode?]()
        queue.append(root)
        
        var containCount = 0    // 包含结点的个数
        while containCount != 2 && !queue.isEmpty {
            let node = queue.removeFirst()
            if node === p || node === q {
                containCount += 1
            }
            
            if node?.left != nil {
                queue.append(node?.left)
            }
            if node?.right != nil {
                queue.append(node?.right)
            }
        }
        
        return containCount == 2
    }
    
    func path(from node1: TreeNode?, to node2: TreeNode?, _ nodes: inout [TreeNode?]) -> Bool {
        if node1 == nil || node2 == nil {
            return false
        }
        
        if node1 === node2 {
            return true
        }
        
        nodes.append(node1);
        if self.path(from: node1?.left, to: node2, &nodes) {
            return true
        }
        if self.path(from: node1?.right, to: node2, &nodes) {
            return true
        }
        nodes.removeLast()
        return false
    }
}
