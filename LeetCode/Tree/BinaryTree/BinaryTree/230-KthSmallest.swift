//
//  230-KthSmallest.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/16.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉搜索树，编写一个函数 kthSmallest 来查找其中第 k 个最小的元素。
 */

import Foundation

class KthSmallest {
    // 记录中序遍历的次数
    private var count = 0
    private var targetValue = 0
    private var canStop = false
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        self.inOrder2(root, k, &count)
        
        return self.targetValue
    }
    
    func kthSmallest2(_ root: TreeNode?, _ k: Int) -> Int {
        func TreeSize(_ root: TreeNode?) -> Int {
            if root == nil {
                return 0
            }
            return 1 + TreeSize(root?.left) + TreeSize(root?.right)
        }
        
        if root == nil {
            return 0
        }
        
        let leftSize = TreeSize(root?.left)
        if leftSize + 1 == k {
            return root!.val
        } else if leftSize >= k {
            return kthSmallest2(root?.left, k)
        } else if leftSize + 1 < k {
            return kthSmallest2(root?.right, k - leftSize - 1)
        }
        return 0
    }
    
    func inOrder(_ root: TreeNode?, _ k: Int) -> Void {
        if root == nil {
            return
        }
        
        if self.canStop {
            return
        }
        
        self.inOrder(root?.left, k)
        self.count += 1
        if self.count == k {
            self.targetValue = root!.val
            self.canStop = true
            return
        }
        self.inOrder(root?.right, k)
    }
    
    func inOrder2(_ root: TreeNode?, _ target: Int, _ count: inout Int) -> Void {
        if root == nil {
            return
        }
        
        self.inOrder2(root?.left, target, &count)
        
        count += 1
        if count == target {
            self.targetValue = root!.val
            return
        } else if count > target {
            return
        }
        
        self.inOrder2(root?.right, target, &count)
    }
}
