//
//  105-BuildTree.swift
//  BinaryTree
//
//  Created by Csy on 2019/4/12.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 根据一棵树的前序遍历与中序遍历构造二叉树。
 你可以假设树中没有重复的元素。
 */

import Foundation

class BuildTree {
    func buildTree(_ preOrder: [Int], _ inOrder: [Int]) -> TreeNode? {
        if preOrder.count != inOrder.count {
            return nil
        }
        
        return self.buildCore(preOrder, 0, inOrder, 0, preOrder.count)
    }
    
    
    ///
    ///
    /// - Parameters:
    ///   - preOrder:
    ///   - preStart: 当前树根所在的下标
    ///   - inOrder:
    ///   - inStart: 当前树，中序遍历的第一个节点所在的下标
    ///   - length: 当前树的长度
    /// - Returns:
    func buildCore(_ preOrder: Array<Int>,
                       _ preStart: Int,
                       _ inOrder: Array<Int>,
                       _ inStart: Int,
                       _ length: Int) -> TreeNode? {
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
        let root = TreeNode(preOrder[preStart])
        
        // 左子树
        let leftLength = inRoot - inStart
        root.left = buildCore(preOrder, preStart+1, inOrder, inStart, leftLength)
        
        // 右子树
        let rightLength = length - leftLength - 1
        root.right = buildCore(preOrder,
                                   preStart + leftLength + 1,
                                   inOrder,
                                   inRoot + 1,
                                   rightLength)
        
        return root
    }

}
