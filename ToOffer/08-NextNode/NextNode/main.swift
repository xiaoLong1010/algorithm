//
//  main.swift
//  NextNode
//
//  Created by Csy on 2018/12/18.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var parent: BinaryTreeNode?
    
    
    init(_ val: Int) {
        self.value = val
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}

func nextNode(_ node: BinaryTreeNode?) -> BinaryTreeNode? {
    if node == nil {
        return nil
    }
    // 如果有右结点，那就一直在该右结点的左边一直找
    else if (node?.right != nil) {
        var next = node?.right
        while next?.left != nil {
            next = next?.left
        }
        return next
    }
    
    //没有右结点，有父结点，那就向上找父结点
    var current = node
    var parent = node?.parent
    
    while parent != nil {
        if parent?.left === current {
            return parent
        }
        current = parent
        parent = parent?.parent
    }
    
    return nil
}

