//
//  53-MaxSubArray.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/3/26.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 
 思路
    dp[i]表示以data[i]结尾的子数组最大值
    dp[i] = data[i]，如果dp[i-1]<0
    dp[i] = dp[i-1]+data[i]，如果data[i-1]>0
 
    由于只和前一个状态有关，可以简化成一个变量
 */

import Foundation

class MaxSubArray {
    func maxSubArray(_ nums: [Int]) -> Int {
        let length = nums.count
        if  length == 0 {
            return 0
        }
        if length == 1 {
            return nums[0]
        }
        
        var preSum = nums[0]
        var maxSum = preSum
        for i in 1...(length-1) {
            // 更新
            let num = nums[i]
            if preSum < 0 {
                preSum = num
            }
            else {
                preSum = preSum + num
            }
            
            // 取最大值
            maxSum = max(maxSum, preSum)
        }
        
        return maxSum
    }
}
