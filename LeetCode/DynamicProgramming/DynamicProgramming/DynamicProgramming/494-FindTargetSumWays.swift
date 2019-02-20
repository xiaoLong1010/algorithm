//
//  494-FindTargetSumWays.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/20.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个非负整数数组，a1, a2, ..., an, 和一个目标数，S。现在你有两个符号 + 和 -。对于数组中的任意一个整数，你都可以从 + 或 -中选择一个符号添加在前面。
 
 返回可以使最终数组和为目标数 S 的所有添加符号的方法数
 
 输入: nums: [1, 1, 1, 1, 1], S: 3
 输出: 5
 解释:
 
 -1+1+1+1+1 = 3
 +1-1+1+1+1 = 3
 +1+1-1+1+1 = 3
 +1+1+1-1+1 = 3
 +1+1+1+1-1 = 3
 
 一共有5种方法让最终目标和为3。
 
 dp[i][j],表示[0...i]个数，组成j-maxSum的的方法数
 dp[i][j] = dp[i-1][j-v[i]] + dp[i-1][j+v[i]]
 
 思路2
 我们怎么通过一维数组解决这个问题呢？实际上这个问题是之前Leetcode 416：分割等和子集（最详细的解法！！！） 提高，我们这里的问题同样可以理解为将nums拆分为P&N两个子集（P做加法，N做减法），那么我们的问题就变成了sum(P)-sum(N)=S也就是2*sum(P)=S+sum(nums)，也就是说S+sum(nums)必须是一个偶数，这是一个非常重要的结论。我们通过这种思想结合动态规划，就可以写出下面的代码
    最后转换成数组的数字，有多少种方式，可以累加的和等于(S+sum(nums))/2
 */

import Foundation

class FindTargetSumWays {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        let numCount = nums.count
        if  numCount == 0 {
            return 0
        }
        
        // 求出最大值
        var maxSum = 0
        for num in nums {
            maxSum += num
        }
        if S > maxSum || ((S + maxSum) % 2) != 0 {
            return 0
        }
        
        // 新的sum
        let target = (S + maxSum) >> 1
        
        // dp[i]表示[0...i]个数字，组成i的个数
        var dp = Array(repeating: 0, count: target+1)
        dp[0] = 1
        
        // 一定要从最大值开始计算
        for num in nums {
            var i = target
            while i >= num {
                dp[i] += dp[i-num]
                i -= 1
            }
        }
        // 这样计算错误
//        for num in nums {
//            for i in 1...target {
//                if i >= num  {
//                    dp[i] += dp[i-num]
//                }
//            }
//        }
        return dp[target]
    }
    
    func findTargetSumWays2(_ nums: [Int], _ S: Int) -> Int {
        let numCount = nums.count
        if  numCount == 0 {
            return 0
        }
        
        // 求出最大值
        var maxSum = 0
        for num in nums {
            maxSum += num
        }
        if S > maxSum || S < -maxSum{
            return 0
        }
        
        // 每行的和是[-maxSum, maxSum]
        let oneList = Array(repeating: 0, count: 2 * maxSum+1)
        var dp = Array(repeating: oneList, count: numCount+1)
        dp[0][maxSum] = 1
        
        for i in 1...numCount {
            for j in 0...2*maxSum {
                if j - nums[i-1] >= 0 {
                    dp[i][j] += dp[i-1][j-nums[i-1]]
                }
                if j + nums[i-1] <= 2*maxSum {
                    dp[i][j] += dp[i-1][j+nums[i-1]]
                }
            }
        }
        
        return dp[numCount][S+maxSum]
    }
    
   
}
