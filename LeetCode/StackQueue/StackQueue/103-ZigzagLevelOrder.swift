//
//  103-ZigzagLevelOrder.swift
//  StackQueue
//
//  Created by Csy on 2019/2/14.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 给定二叉树 [3,9,20,null,null,15,7]
 结果
 [
 [3],
 [20,9],
 [15,7]
 ]
 
 思路一
    1 使用双端队列
    2 第0层，从前入队，从前出队
    3 第1层，从后入队，从后出对
    4 入队的时候，也要根据层级，确定左子结点和右子结点的入队顺序
 */


import Foundation

class ZigzagLevelOrder {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var results = [[Int]]()
        var deque = Deque<TreeNode>()
        deque.enqueueFront(root!)
        var level = 0
        
        while !deque.isEmpty {
            let isEven = ((level % 2) == 0)
            let countOfLevel = deque.count
            
            if isEven {
                var aResult = [Int]()
                for _ in 1...countOfLevel {
                    // 偶数层的node，从前出队
                    let node = deque.dequeue()
                    aResult.append(node!.val)
                    
                    // 奇数层的node，从后入队，先左后右
                    if node?.left != nil {
                        deque.enqueue((node?.left)!)
                    }
                    if node?.right != nil {
                        deque.enqueue((node?.right)!)
                    }
                }
                results.append(aResult)
            } else {
                var aResult = [Int]()
                for _ in 1...countOfLevel {
                    // 奇数层的node，从后出队
                    let node = deque.dequeueBack()
                    aResult.append(node!.val)
                    
                    // 偶数层的node，从前入队，先右后左
                    if node?.right != nil {
                        deque.enqueueFront((node?.right)!)
                    }
                    if node?.left != nil {
                        deque.enqueueFront((node?.left)!)
                    }
                }
                results.append(aResult)
            }
            level += 1
        }
        
        return results
    }
}
