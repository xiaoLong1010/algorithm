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
// 112 是否存在一个路径，和为sum
// 226 Invert Binary Tree
// 100 Same Tree
// 101 Symmetric Tree，对称
// 222 求完全二叉树的结点数
// 110 判断是否为平衡二叉树

// 257 Binary Tree Paths，二叉树的所有路径
// 129 Sum root to leaf numbers

// 236 普通二叉树，最近的公共祖先
// 543 二叉树的直径
// 617 Merge Two Binary Trees

/**
 437 Path Sum 3
 1. 允许有负数的话，如果一个结点满足了，还必须往下找
 */
// 404 所有左叶子的和

// -----------------------------------------------------------
// 104 二叉树的最大深度
func maxDepth_104(_ head: BinaryTreeNode?) -> Int{
    guard head != nil else {
        return 0
    }
    
    let leftDepth = maxDepth_104(head?.left)
    let rightDepth = maxDepth_104(head?.right)
    
    let max = leftDepth > rightDepth ? leftDepth : rightDepth
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
// 543 二叉树的直径
var diameter = 0
func diameter_543(_ root: BinaryTreeNode?) -> Int {
    diameterCore(root)
    return diameter
}

func diameterCore(_ root: BinaryTreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    
    let leftDepth = diameterCore(root?.left)
    let rightDepth = diameterCore(root?.right)
    diameter = max(diameter, (leftDepth + rightDepth))
    return max(leftDepth, rightDepth) + 1
}

// 617 Merge Two Binary Trees
func mergeTree_617(_ root1: BinaryTreeNode?, _ root2: BinaryTreeNode?) -> BinaryTreeNode? {
    if root1 == nil && root2 == nil {
        return nil
    }
    
    // 其中一个为nil
    if root1 == nil {
        return root2
    }
    
    if root2 == nil {
        return root1
    }
    
    // 都不是nil，就需要合并
    let root = BinaryTreeNode(root1!.value + root2!.value)
    root.left = mergeTree_617(root1?.left, root2?.left)
    root.right = mergeTree_617(root1?.right, root2?.right)
    return root
}
// 110 判断是否为平衡二叉树
// 每个节点，左右子树高度，相差不超过1
var isBalance = true
func isBalance_110(_ head: BinaryTreeNode?) -> Bool {
    // 通过比较每个节点的高度
    isBalanceCore(head)
    return isBalance
}

func isBalanceCore(_ head: BinaryTreeNode?) -> Int {
    guard head != nil else {
        return 0
    }
    
    let leftCount = isBalanceCore(head?.left)
    let rightCount = isBalanceCore(head?.right)
    
    if abs(leftCount - rightCount) > 1 {
        isBalance = false
    }

    return 1 + max(leftCount, rightCount)
}

// 100 Same Tree，两个树是否相等
func isSameTree(_ root1: BinaryTreeNode?, _ root2: BinaryTreeNode?) -> Bool {
    if root1 == nil && root2 == nil {
        return true
    }
    
    // 一个为nil，另外一个不是nil
    if root1 == nil || root2 == nil {
        return false
    }
    
    // 都不为nil，先比较value，再比较左右子树
    if root1!.value == root2!.value {
        return isSameTree(root1?.left, root2?.left) && isSameTree(root1?.right, root2?.right)
    } else {
        return false
    }
}

// 101 Symmetric Tree，求一个树是否对称
func isSymmetrical(_ root1: BinaryTreeNode?, _ root2: BinaryTreeNode?) -> Bool {
    if root1 == nil && root2 == nil {
        return true
    }
    
    // 一个是nil，一个不是nil
    if root1 == nil || root2 == nil {
        return false
    }
    
    // 都不是nil，就比较value
    if root1!.value != root2!.value {
        return false
    }
    
    return isSymmetrical(root1?.left, root2?.right) &&
        isSymmetrical(root1?.right, root2?.left)
}

// 226 Invert Binary Tree
func invertTree(_ root: BinaryTreeNode?) -> BinaryTreeNode? {
    guard root != nil else {
        return nil
    }
    
    let left = root?.left
    root?.left = invertTree(root?.right)
    root?.right = invertTree(left)
    return root
}

/**
注意二叉树递归终止条件
 */
// 112 是否存在一个路径，和为sum
func hasPathSum_112(_ root: BinaryTreeNode?, sum: Int) -> Bool {
    guard root != nil else {
        return false
    }
    
    // 值相等，而且必须是叶子结点
    if root!.value == sum && root!.left == nil && root!.right == nil {
        return true
    }
    
    return hasPathSum_112(root?.left, sum: sum - root!.value) ||
        hasPathSum_112(root?.right, sum: sum - root!.value)
}

/**
 437 Path Sum 3
 1. 允许有负数的话，如果一个结点满足了，还必须往下找
 */
func countOfPathSum_437(_ root: BinaryTreeNode?, sum: Int) -> Int {
    guard root != nil else {
        return 0
    }
    // 以root为起点的路径
    // 左右子树的路径
    return pathSumOfNode(root,sum: sum) +
        countOfPathSum_437(root?.left, sum:sum - root!.value) +
        countOfPathSum_437(root?.right, sum:sum - root!.value)
}

func pathSumOfNode(_ node: BinaryTreeNode?, sum: Int) -> Int {
    guard node != nil else {
        return 0
    }
    var count = 0
    if node!.value == sum {
        count += 1
    }
    
    // node加子节点，也可能加起来的等于sum，因为有s负数
    count += pathSumOfNode(node?.left, sum:(sum - node!.value))
    count += pathSumOfNode(node?.right, sum:(sum - node!.value))
    return count
}

// 222 求完全二叉树的结点数
func numOfNodes_222(_ root: BinaryTreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    // 查看以该节点为root的左边高度
    var leftHeight = 0
    var leftNode = root
    while leftNode != nil {
        leftHeight += 1
        leftNode = leftNode?.left
    }
    
    // 查看以该节点为root的右边高度
    var rightHeight = 0
    var rightNode = root
    while rightNode != nil {
        rightHeight += 1
        rightNode = rightNode?.left
    }
    
    // 左右相等，说明子树，是满二叉树
    if leftHeight == rightHeight {
        return (1 << leftHeight) - 1
    } else {
        return 1 + numOfNodes_222(root?.left) + numOfNodes_222(root?.right)
    }
}
// 236 普通二叉树，最近的公共祖先
func lowestCommonAncestor_236(_ root: BinaryTreeNode?, _ node1: BinaryTreeNode?, _ node2: BinaryTreeNode?) -> BinaryTreeNode? {
    if root == nil {
        return nil
    }
    if root === node1 || root === node2 {
        return root
    }
    
    // 递归搜索左右子树
    let left = lowestCommonAncestor_236(root?.left, node1, node2)
    let right = lowestCommonAncestor_236(root?.right, node1, node2)
    
    // 左右都不为空
    if left != nil && right != nil {
        return root
    }
    else if left == nil {
        return right
    }
    else {
        return left
    }
}

// 非递归前序遍历1
func preOrderNR1(_ root: BinaryTreeNode?) -> Void {
    guard root != nil else {
        return
    }
    
    var stack = Stack<BinaryTreeNode>()
    stack.push(root!)
    
    // 根据栈的特点，先push右边，再左边
    // 出栈的时候就是先左边，再右边
    while !stack.isEmpty() {
        let node = stack.pop()
        print(node!.value)
        
        if let right = node?.right {
            stack.push(right)
        }
        
        if let left = node?.left {
            stack.push(left)
        }
    }
}

// 非递归前序遍历2
func preOrderNR2(_ root: BinaryTreeNode?) -> Void {
    guard root != nil else {
        return
    }
    
    var node = root
    var stack = Stack<BinaryTreeNode>()
    
    // 先把所有的子树的root都push进去
    // 再依次访问左右
    while node != nil || !stack.isEmpty() {
        if node != nil {
            print(node!.value)
            stack.push(node!)
            node = node?.left
        }
        else {
            node = stack.pop()?.right
        }
    }
}
