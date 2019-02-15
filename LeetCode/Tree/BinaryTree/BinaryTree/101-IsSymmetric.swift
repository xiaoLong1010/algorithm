//
//  101-IsSymmetric.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 树是否是镜像的

 思路一
    1 相当于比较两个树是否相等
    2 一个是从左到右，一个是从右到左
 */
import Foundation

class IsSymmetric {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return self.isSame(root?.left, root?.right)
    }
    
    func isSame(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }
        
        // 一个为nil，另外一个不是nil
        if root1 == nil || root2 == nil {
            return false
        }
        
        // 都不为nil，先比较value，再比较左右子树
        if root1!.val == root2!.val {
            return isSame(root1?.left, root2?.right) && isSame(root1?.right, root2?.left)
        } else {
            return false
        }
    }
}
