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
}
