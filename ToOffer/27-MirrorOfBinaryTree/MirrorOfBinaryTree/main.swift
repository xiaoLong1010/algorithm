//
//  main.swift
//  MirrorOfBinaryTree
//
//  Created by Csy on 2018/11/18.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ val: Int) {
        self.value = val
        self.left = nil
        self.right = nil
    }
}

func mirror(_ head: BinaryTreeNode?) -> Void {
    if head == nil {
        return
    }
    
    if head?.left == nil && head?.right == nil {
        return
    }
    
    // 交换当前结点的左右结点
    let temp = head?.left
    head?.left = head?.right
    head?.right = temp
    
    // 左右结点为根结点，d递归操作
    mirror(head?.left)
    mirror(head?.right)
}

