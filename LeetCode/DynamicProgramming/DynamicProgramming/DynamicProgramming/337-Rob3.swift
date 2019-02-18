//
//  337-Rob3.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/18.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 在上次打劫完一条街道之后和一圈房屋后，小偷又发现了一个新的可行窃的地区。这个地区只有一个入口，我们称之为“根”。 除了“根”之外，每栋房子有且只有一个“父“房子与之相连。一番侦察之后，聪明的小偷意识到“这个地方的所有房屋的排列类似于一棵二叉树”。 如果两个直接相连的房子在同一天晚上被打劫，房屋将自动报警。
 
 计算在不触动警报的情况下，小偷一晚能够盗取的最高金额。
 
 dp[node]表示抢劫以node为根的最高金额
 
 dp[node] = max{v[node]+dp[left[left&&right]]+dp[right[left&&right]], dp[left]+dp[right]}
 
 需要先把最后一个层级的初始值计算出来
 */

import Foundation

class Rob3 {
    private var dp = [TreeNode: Int]()
    
    func rob(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let results = self.robCore2(root)
        
        return max(results.contain, results.notContain)
    }
    
    // 返回以root为根的最大值，contain表示抢劫root，notContain不抢劫root
    func robCore2(_ root: TreeNode?) -> (contain: Int, notContain: Int) {
        if root == nil {
            return (0,0)
        }
        
        let leftNums = self.robCore2(root?.left)
        let rightNums = self.robCore2(root?.right)
        
        let containNum = root!.val + leftNums.notContain + rightNums.notContain
        // 使用这个更高效
        let notContainNum = max(leftNums.contain+rightNums.contain,
                                leftNums.contain+rightNums.notContain,
                                leftNums.notContain+rightNums.contain,
                                leftNums.notContain+rightNums.notContain)
        
//        let notContainNum = max(leftNums.contain,leftNums.notContain) +
//                            max(rightNums.contain, rightNums.notContain)
        
        return (containNum, notContainNum)
    }
    
    // 这种耗时较长
    func rob1(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return self.robCore(root)
    }
    
    func robCore(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        // 已经保存了相关值，就直接返回
        if let value = self.dp[root!] {
            return value
        }
        
        // 比较两个值的大小
        let num1 = root!.val +
                    self.robCore(root?.left?.left) +
                    self.robCore(root?.left?.right) +
                    self.robCore(root?.right?.left) +
                    self.robCore(root?.right?.right)
        let num2 = self.robCore(root?.left) + self.robCore(root?.right)
        
        let maxNum = max(num1, num2)
        self.dp[root!] = maxNum
        
        return maxNum
    }
    
    func leafNodes(_ root: TreeNode?) -> Void {
        if root == nil {
            return
        }
        
        if root?.left == nil && root?.right == nil {
            dp[root!] = root!.val
            return
        }
        
        self.leafNodes(root?.left)
        self.leafNodes(root?.right)
    }
}

// TreeNode支持Hash
extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
//        hasher.combine(self.left)
//        hasher.combine(self.right)
    }
}
