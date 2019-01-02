//
//  Knapsack.swift
//  DynamicProgramming
//
//  Created by Csy on 2018/12/26.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

// dp[i][j],前i件物品，体积不超过j情况下的最大value
// dp[i][j] = max(dp[i-1][j],v[i]+dp[i-1][j-w[i]])
class Knapsack {
    var history = Array<Array<Int>>()
    
    // 动态规划，自底向上逐渐累加
    func solution1(values: Array<Int>, weights: Array<Int>, maxCapacity: Int) -> Int {
        let length = values.count
        if !((length > 0) && weights.count == length && maxCapacity > 0) {
            return 0
        }
        
        // 初始化保存的数组
        let oneRow = Array(repeating: 0, count: maxCapacity+1)
        var dp = Array(repeating: oneRow, count: length)
        // 初始化第一行数据
        for index in 0...maxCapacity {
            if weights[0] <= index {
                dp[0][index] = values[0]
            }
        }
        
        for i in 1...(length - 1) {
            for j in 0...(maxCapacity) {
                // 计算dp[i-1][j]
                let temp1 = dp[i-1][j]
                
                // 计算v[i]+dp[i-1][j-w[i]]
                var temp2 =  0
                if (j - weights[i] >= 0) {
                    temp2 = values[i] + dp[i-1][j-weights[i]]
                }
                
                dp[i][j] = max(temp1, temp2)
            }
        }
        return dp[length-1][maxCapacity]
    }
    
    // 记忆搜索，自顶向下递归
    func solution2(values: Array<Int>, weights: Array<Int>, maxCapacity: Int) -> Int {
        let length = values.count
        if !((length > 0) && weights.count == length && maxCapacity > 0) {
            return 0
        }
        
        // 初始化保存的数组
        let oneRow = Array(repeating: -1, count: maxCapacity+1)
        self.history = Array(repeating: oneRow, count: length)
        
        return self.solutionCore2(values: values, weights: weights, index: length - 1, capacity: maxCapacity)
    }
    
    func solutionCore2(values: Array<Int>, weights: Array<Int>, index: Int, capacity: Int) -> Int {
        if index < 0 || capacity < 0{
            return 0
        }
        
        if self.history[index][capacity] != -1 {
            return self.history[index][capacity]
        }
        
        // 计算dp[index-1][j]
        let temp1 = self.solutionCore2(values: values, weights: weights, index: index-1, capacity: capacity)
        
        var temp2 = 0
        if capacity >= weights[index] {
            temp2 = values[index] + self.solutionCore2(values: values, weights: weights, index: index-1, capacity: capacity-weights[index])
        }
        self.history[index][capacity] = max(temp1, temp2)
        
        return self.history[index][capacity]
    }
}
