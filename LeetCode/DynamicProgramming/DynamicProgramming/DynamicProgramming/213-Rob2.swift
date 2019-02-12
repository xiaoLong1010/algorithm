//
//  213-Rob2.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/12.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。这个地方所有的房屋都围成一圈，这意味着第一个房屋和最后一个房屋是紧挨着的。同时，相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
 
 给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
 
 输入: [2,3,2]
 输出: 3
 解释: 你不能先偷窃 1 号房屋（金额 = 2），然后偷窃 3 号房屋（金额 = 2）, 因为他们是相邻的。
 
 先计算[0,n-2]
 再计算[1,n-1]
 取较大值
 */
import Foundation

class Rob2 {
    func solution1(_ nums: [Int]) -> Int {
        let count = nums.count
        
        if count == 0  {
            return 0
        }
        if count == 1  {
            return nums[0]
        }
        
        let max1 = self.helper(nums, 0, count-2)
        let max2 = self.helper(nums, 1, count-1)
        
        return max(max1, max2)
    }
    
    private func helper(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        let count = end - start + 1
        if count <= 0 {
            return 0
        }
        if count == 1 {
            return nums[start]
        }
        
        var dp = Array(repeating: 0, count: count)
        dp[0] = nums[start]
        
        for i in start+1...end {
            let value1 = nums[i] + ((i-start-2)>=0 ? dp[i-start-2] : 0)
            let value2 = dp[i-start-1]
            dp[i-start] = max(value1, value2)
        }
        
        return dp[count-1]
    }
    
    private func helper2(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        let count = end - start + 1
        if count <= 0 {
            return 0
        }
        if count == 1 {
            return nums[start]
        }
        
        var pre = 0
        var current = 0
        
        for i in start...end {
            let value1 = pre + nums[i]      // dp[i-2]+v(i)
            let value2 = current            // dp[i-1]
            
            // 更新值
            (current, pre) = (max(value1, value2), current)
        }
        
        return current
    }
}
