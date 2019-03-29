//
//  300-LIS.swift
//  DynamicProgramming
//
//  Created by Csy on 2018/12/27.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class LongestIncreaseSubsequence {
    
    // 动态规划.dp[i]表示以i结尾的最长递增子序列长度
    // dp
    func solution1(_ nums: Array<Int>) -> Int {
        let length = nums.count
        if length == 0 {
            return 0
        }
        
        if length == 1 {
            return 1
        }
        
        // 初始化。除了dp[0]符合定义，其他的dp[i]的初始值，都是最小值
        var dp = Array(repeating: 1, count: length)
        
        // 从下到上，依次计算dp
        for i in 1...(length - 1) {
            for j in 0...(i - 1) {
                // 计算dp[i]的值
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], 1 + dp[j])
                }
            }
        }
        
        // 计算dp中的最大值
        var maxNum = dp[0]
        for num in dp {
            if num > maxNum {
                maxNum = num
            }
        }
        
        return maxNum
    }
    
    // dp[i]表示长度i+1的子序列，对应的值表示这些子序列中最后一个数字的最小值,长度i+1的子序列有多个
    func solution2(_ nums: Array<Int>) -> Int {
        let length = nums.count
        if length == 0 {
            return 0
        }
        if length == 1 {
            return 1
        }
        
        // 初始化
        var dp = Array(repeating: 0, count: length)
        dp[0] = nums[0]
        var dpMaxIndex = 0
        
        
        // 从下到上，依次计算dp
        for i in 1...(length - 1) {
            let newNum = nums[i]
            
            // 有更大的值，就添加到dp尾部
            if newNum > dp[dpMaxIndex] {
                dpMaxIndex += 1
                dp[dpMaxIndex] = newNum
            } else {
                // 0-dpMaxIndex,找到大于等于newNum的第一个元素所在的索引
                let index = self.search(dp, maxIndex: dpMaxIndex, target: newNum)
                dp[index] = newNum
            }
        }
        
        return dpMaxIndex + 1
    }
    
    // 找到大于等于target的第一个元素所在的索引
    func search(_ dp: Array<Int>, maxIndex: Int, target: Int) -> Int {
        var left = 0
        var right = maxIndex
        
        while left < right {
            let mid = left + (right-left)>>1
            let middleValue = dp[mid]
            if target == middleValue {
                return mid
            } else if target < middleValue {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
