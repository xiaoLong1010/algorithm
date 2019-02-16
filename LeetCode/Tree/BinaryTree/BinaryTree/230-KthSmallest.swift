//
//  230-KthSmallest.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/16.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class KthSmallest {
    // 记录中序遍历的次数
    private var count = 0
    private var targetValue = 0
    private var canStop = false
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        self.inOrder(root, k)
        
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
}
