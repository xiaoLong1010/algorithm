//
//  main.swift
//  Construct
//
//  Created by Csy on 2018/12/18.
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

func construct(_ preOrder: Array<Int>, _ inOrder: Array<Int>) -> BinaryTreeNode? {
    if preOrder.count != inOrder.count {
        return nil
    }
    return constructCore(preOrder, 0, inOrder, 0, preOrder.count)
}

func constructCore(_ preOrder: Array<Int>,
                   _ preStart: Int,
                   _ inOrder: Array<Int>,
                   _ inStart: Int,
                   _ length: Int) -> BinaryTreeNode? {
    if length == 0 {
        return nil
    }
    
    // 求中序遍历中，root所在的下标
    var inRoot = 0
    for index in inStart..<(inStart + length) {
        if preOrder[preStart] == inOrder[index] {
            inRoot = index
        }
    }
    
    // 创建root
    let root = BinaryTreeNode(preOrder[preStart])
    
    // 左子树
    let leftLength = inRoot - inStart
    root.left = constructCore(preOrder, preStart+1, inOrder, inStart, leftLength)
    
    // 右子树
    let rightLength = length - leftLength - 1
    root.left = constructCore(preOrder,
                              preStart + leftLength + 1,
                              inOrder,
                              inRoot + 1,
                              rightLength)
    
    return root
}

