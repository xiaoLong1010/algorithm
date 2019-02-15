//
//  129-SumNumbers.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/15.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class SumNumbers {
    func sumNumbers(_ root: TreeNode?) -> Int {
        return self.sumNumbersCore(root,0)
    }
    
    func sumNumbersCore(_ root: TreeNode?, _ result: Int) -> Int {
        if root == nil {
            return 0
        }
        
        let rootVal = root!.val
        let sum = result * 10 + rootVal
        
        // 如果是叶子结点，就计算这条路径的最终结果了
        if root?.left == nil && root?.right == nil {
            return result * 10 + rootVal
        }
        
        // 加上左边结果和右边结果
        let leftResult = self.sumNumbersCore(root?.left, sum)
        let rightResult =  self.sumNumbersCore(root?.right, sum)
        
        return leftResult + rightResult
    }
    
    func sumNumbers2(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var sum = 0
        var stack:[(node: TreeNode, tempSum: Int)] = [(root!, 0)]
        
        while !stack.isEmpty {
            let aTuple = stack.removeLast()
            let updateNum = aTuple.tempSum * 10 + aTuple.node.val
            
            if aTuple.node.left == nil && aTuple.node.right == nil {
                sum += updateNum
                continue
            }
            
            if let leftNode = aTuple.node.left {
                stack.append((leftNode, updateNum))
            }
            
            if let rightNode = aTuple.node.right {
                stack.append((rightNode, updateNum))
            }
        }
        
        return sum
    }

}
