//
//  BinarySearchTree.swift
//  BinaryTree
//
//  Created by Csy on 2018/12/14.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

/**
 应用
    最大值，最小值
    前驱，后继
    上界，下界
    某个元素的排名
    寻找第K大元素排名
 
 235 最近公共祖先
 98 验证是否为二分搜索树
    根据定义，递归验证
 450 在二叉搜索树中删除一个结点
    删除的结点不存在
    是否可能有多个需要删除的结点
    删除的节点是否需要返回
 108 将有序数组，转换为平衡的二分搜索树
 230 二叉搜索树的第K大元素
 */

func lowestCommonAncestor_235(_ root: BinaryTreeNode?, _ node1: BinaryTreeNode?, _ node2: BinaryTreeNode?) -> BinaryTreeNode? {
    if !(root != nil && node1 != nil && node2 != nil) {
        return nil
    }
    let value1 = node1!.value
    let value2 = node2!.value
    let rootValue = root!.value
    
    // 两个结点小于root，那公共结点就在左边
    if rootValue > value1 && rootValue > value2  {
        return lowestCommonAncestor_235(root?.left, node1, node2)
    }
    
    // 两个结点大于root，那公共结点就再右边
    if rootValue < value1 && rootValue < value2  {
        return lowestCommonAncestor_235(root?.right, node1, node2)
    }
    
    return root
}




