//
//  100-IsSameTree.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class IsSameTree {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        // 一个为nil，另外一个不是nil
        if p == nil || q == nil {
            return false
        }
        
        // 都不为nil，先比较value，再比较左右子树
        if p!.val == q!.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else {
            return false
        }
    }
}
