//
//  450-DeleteNode.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/16.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉搜索树的根节点 root 和一个值 key，删除二叉搜索树中的 key 对应的节点，并保证二叉搜索树的性质不变。返回二叉搜索树（有可能被更新）的根节点的引用。
 
 思路
 // 删除掉以node为根的二分搜索树中值为e的节点, 递归算法
 // 返回删除节点后新的二分搜索树的根
 */
import Foundation

class DeleteNode {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        /*
         *  思路:
         *  1,找到需要被删除的节点
         *  2,没有子节点,直接删除
         *  3,一个子节点,直接替换
         *  4,两个子节点,中序遍历的第一个节点替换,BST的中序遍历就是排好序的
         */
        if root == nil {
            return root
        }
        
        let temp = root
        
        if temp!.val > key {
            // 在以左结点为root的树，删除key结点
            temp?.left = deleteNode(temp?.left, key)
            return temp
        } else if temp!.val < key {
            // 在以右结点为root的树，删除key结点
            temp?.right = deleteNode(temp?.right, key)
            return temp
        } else {
            // temp的值等于key，temp需要被删除
            
            // temp只有右子树，那就返回第一个右结点
            if temp?.left == nil {
                return temp?.right
            }
            
            // temp只有左子树，那就返回第一个左结点
            if temp?.right == nil {
                return temp?.left
            }
            
            // temp左右子树都有
            // 找到temp大的最小节点, 即待删除节点右子树的最小节点
            // 用这个节点顶替待删除节点的位置
            var aNode = temp!.right!
            while aNode.left != nil{
                aNode = aNode.left!
            }
            
            // aNode是新树的根结点，一定要设置right，再设置left
            aNode.right = deleteNode(temp?.right, aNode.val)
            aNode.left = temp?.left
            
            temp?.left = nil
            temp?.right = nil
            return aNode
        }
    }
}
