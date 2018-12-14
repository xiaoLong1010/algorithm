//
//  main.swift
//  BinaryTree
//
//  Created by Csy on 2018/12/13.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation
/**
 平衡二叉树：AVL 红黑树
 
 堆，并查集
 
 线段树：处理线段；Trie，字典树，处理字符串
 
 */

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

// 104 二叉树的最大深度
// 111 二叉树的最小深度
// 226 Invert Binary Tree
// 100 Same Tree
// 101 Symmetric Tree，对称
// 222 求完全二叉树的结点数
// 110 判断是否为平衡二叉树

// 257 Binary Tree Paths，二叉树的所有路径
// 129 Sum root to leaf numbers

// 236 普通二叉树，最近的公共祖先

/**
 437 Path Sum 3
 1. 允许有负数的话，如果一个结点满足了，还必须往下找
 */

// 104 二叉树的最大深度
func maxDepth_111(_ head: BinaryTreeNode?) -> Int{
    guard head != nil else {
        return 0
    }
    
    let leftCount = maxDepth_111(head?.left)
    let rightCount = maxDepth_111(head?.right)
    
    let max = leftCount > rightCount ? leftCount : rightCount
    return 1 + max
}

// 111 二叉树的最小深度
func minDepth_111(_ head: BinaryTreeNode?) -> Int{
    guard head != nil else {
        return 0
    }
    
    let leftCount = minDepth_111(head?.left)
    let rightCount = minDepth_111(head?.right)
    
    // 1 当前结点是叶子结点
    // 2 当前结点只有一个子结点
    if leftCount == 0 || rightCount == 0 {
        return 1 + leftCount + rightCount
    } else {        // 当前不是叶子结点
        let min = leftCount < rightCount ? leftCount : rightCount
        return 1 + min
    }
}

/**
注意二叉树递归终止条件
 */
// 112 是否存在一个路径，和为sum
// 404 所有左叶子的和


