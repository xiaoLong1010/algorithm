//
//  377-CombinationSum4.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/19.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个由正整数组成且不存在重复数字的数组，找出和为给定目标正整数的组合的个数。
 示例
 nums = [1, 2, 3]
 target = 4
 
 所有可能的组合为：
 (1, 1, 1, 1)
 (1, 1, 2)
 (1, 2, 1)
 (1, 3)
 (2, 1, 1)
 (2, 2)
 (3, 1)
 
 请注意，顺序不同的序列被视作不同的组合。
 
 因此输出为 7
 
 思路一
    dp[i]表示和是i的组合数
    dp[i] = Sum{dp[i-num1],dp[i-num2],dp[i-num3]...}
 */

import Foundation

class CombinationSum4 {
    // 对于target=10000，有数据溢出的问题。
    // leetcode自己的计算结果也会溢出
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        let numCount = nums.count
        if numCount == 0 || target <= 0{
            return 0
        }
        
        // 初始化dp。dp[i]表示target是i的组合数
        var dp = Array(repeating: 0, count: target+1)
        dp[0] = 1
        
        // 根据状态方程进行计算
        for i in 1...target {
            for num in nums {
                if i - num >= 0 {
                    dp[i] += dp[i-num]
                }
            }
        }
        
        return dp[target]
    }
}
