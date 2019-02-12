//
//  198-HouseRobber.swift
//  DynamicProgramming
//
//  Created by Csy on 2018/12/26.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

/**
 题目描述：抢劫一排住户，但是不能抢邻近的住户，求最大抢劫量。
 
 定义 dp 数组用来存储最大的抢劫量，其中 dp[i] 表示抢到第 i 个住户时的最大抢劫量。
 
 由于不能抢劫邻近住户，如果抢劫了第 i -1 个住户，那么就不能再抢劫第 i 个住户，所以
 
 */
// dp(i) = max(num[i]+dp(i-2),dp(i-1))
class HouseRobber {
    private var historyList = Array<Int>()
   
    // 动态规划，自底向上逐渐累加
    func solution1(_ nums: Array<Int>) -> Int {
        if nums.count == 0  {
            return 0
        }
        if nums.count == 1  {
            return nums[0]
        }
        
        let length = nums.count
        var historyList = Array(repeating: 0, count: length)
        historyList[0] = nums[0]
        
        for index in 1...(length-1) {
            let temp1 = nums[index] + ((index - 2 >= 0) ? historyList[index - 2] : 0)
            let temp2 = historyList[index - 1]
            historyList[index] = max(temp1, temp2)
        }
        return historyList[length-1]
    }
    
    func solution2(_ nums: Array<Int>) -> Int {
        if nums.count == 0  {
            return 0
        }
        
        return solutionCore2(nums, nums.count - 1)
    }
    
    func solutionCore2(_ nums: Array<Int>, _ index: Int) -> Int {
        if index < 0 {
            return 0
        }
        
        return max(nums[index] + solutionCore2(nums, index-2), solutionCore2(nums, index-1))
    }
    
    func solution3(_ nums: Array<Int>) -> Int {
        let length = nums.count
        
        if length == 0  {
            return 0
        }
        self.historyList = Array(repeating: -1, count: length)
        
        return solutionCore3(nums, length - 1)
    }
    
    func solutionCore3(_ nums: Array<Int>, _ index: Int) -> Int {
        if index < 0 {
            return 0
        }
        
        // 在保存的数据中，找到了，就直接返回
        if self.historyList[index] != -1 {
            return self.historyList[index]
        }
        
        self.historyList[index] = max(nums[index] + solutionCore2(nums, index-2), solutionCore2(nums, index-1))
        return self.historyList[index]
    }
    
}
