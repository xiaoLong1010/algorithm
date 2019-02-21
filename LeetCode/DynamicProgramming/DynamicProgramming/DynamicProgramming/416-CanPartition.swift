//
//  416-CanPartition.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/21.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个只包含正整数的非空数组。是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。
 注意:
 
 每个数组中的元素不会超过 100
 数组的大小不会超过 200
 
 输入: [1, 5, 11, 5]
 
 输出: true
 
 解释: 数组可以分割成 [1, 5, 5] 和 [11].
 
 思路
    1 数组的和是sum，求数组里的数字，组成的和是sum/2，并且sum是偶数
    2 dp[i]表示数组里的数字，是否可以组成i
    3 dp[i] = dp[i] || dp[i- num]
    4 需要遍历数组，更新dp。意思就是
        - 第一次，只有num1，更新一遍dp
        - 第二次，{num1,num2},更新一遍dp
 */

import Foundation

class CanPartition {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0){$0 + $1}
        if sum <= 0 || (sum % 2) != 0 {
            return false
        }
        
        // 初始化dp
        let target = sum / 2
        var dp = Array(repeating: false, count: target+1)
        dp[0] = true
        
        // 根据方法
        for num in nums {
            var i = target
            while i - num >= 0 {
                dp[i] = dp[i] || dp[i-num]
                i -= 1
            }
        }
        return dp[target]
    }
}
