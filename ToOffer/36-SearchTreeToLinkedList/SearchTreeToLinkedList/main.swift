//
//  main.swift
//  SearchTreeToLinkedList
//
//  Created by Csy on 2018/12/18.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation
// https://www.cnblogs.com/zle1992/p/8035140.html

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
/**
 // 1.将左子树构造成双链表，并返回链表头节点
 10         TreeNode left = Convert(root.left);
 11         TreeNode p = left;
 12         // 2.定位至左子树双链表最后一个节点
 13         while(p!=null&&p.right!=null){
 14             p = p.right;
 15         }
 16         // 3.如果左子树链表不为空的话，将当前root追加到左子树链表
 17         if(left!=null){
 18             p.right = root;
 19             root.left = p;
 20         }
 21         // 4.将右子树构造成双链表，并返回链表头节点
 22         TreeNode right = Convert(root.right);
 23         // 5.如果右子树链表不为空的话，将该链表追加到root节点之后
 24         if(right!=null){
 25             right.left = root;
 26             root.right = right;
 27         }
 28         return left!=null?left:root;
 */

func convert(_ root: BinaryTreeNode?) -> BinaryTreeNode? {
    if root == nil {
        return nil
    }
    if root?.left == nil && root?.right == nil {
        return root
    }
    // 1.将左子树构造成双链表，并返回链表头节点
    let left = convert(root?.left)
    var p = left
    // 2.定位至左子树双链表最后一个节点
    while p != nil && p?.right != nil {
        p = p?.right
    }
    // 3.如果左子树链表不为空的话，将当前root追加到左子树链表
    if left != nil {
        p?.right = root
        root?.left = p
    }
    
    // 4.将右子树构造成双链表，并返回链表头节点
    let right = convert(root?.right)
    // 5.如果右子树链表不为空的话，将该链表追加到root节点之后
    if right != nil {
        right?.left = root
        root?.right = right
    }
    
    // 如果左子树是空的，那就root是第一个结点
    return left == nil ? root : left
}

func convert2(_ root: BinaryTreeNode?, last: inout BinaryTreeNode?) -> Void {
    if root == nil {
        return
    }
    
    // 先左子树构造成双链表
    let current = root
    if current?.left != nil {
        convert2(current?.left, last: &last)
    }
    // 当前root的left指向左子树最后一个结点
    current?.left = last
    // 如果左子树不为空，将root链接到左子树
    if last != nil {
        last?.right = current
    }
    
    // root变成链表最后一个结点
    last = current
    
    // 构造右子树
    if current?.right != nil {
        convert2(current?.right, last: &last)
    }
}

var node10 = BinaryTreeNode(10)
var node6 = BinaryTreeNode(6)
var node14 = BinaryTreeNode(14)
var node4 = BinaryTreeNode(4)
var node8 = BinaryTreeNode(8)
var node12 = BinaryTreeNode(12)
var node16 = BinaryTreeNode(16)

node10.left = node6
node10.right = node14
node6.left = node4
node6.right = node8
node14.left = node12
node14.right = node16

//var head = convert(node10)
//print(head as Any)

var last: BinaryTreeNode? = nil
convert2(node10, last: &last)
print(last ?? "")
