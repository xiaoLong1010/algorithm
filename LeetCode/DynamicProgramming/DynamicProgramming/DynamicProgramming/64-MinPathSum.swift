//
//  64-MinPathSum.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/17.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 说明：每次只能向下或者向右移动一步。
 
 dp[i][j]表示起点到[i,j]的最小路径
 dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + v[i][j]
 
 */

import Foundation

class MinPathSum {
    // 改进的dp，可以只使用一维数组
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        let m = grid.count
        let n = grid[0].count
        var dp = Array(repeating:0, count: n)
        dp[0] = grid[0][0]
        for i in 1..<n {
            dp[i] = dp[i - 1] + grid[0][i]
        }
        for i in 1..<m {
            for j in 0..<n {
                if j == 0 {
                    dp[j] += grid[i][0]
                } else {
                    // dp[j]表示到[i-1,j]的最小值，dp[j-1]表示到[i,j-1]的最小值
                    dp[j] = min(dp[j], dp[j - 1]) + grid[i][j]
                }
            }
        }
        return dp[n - 1]
    }
    
    func minPathSum2(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        let rows = grid.count
        let cols = grid[0].count
        
        // 初始化dp
        var dp = Array(repeating:Array(repeating:0,count:cols),count:rows)
        dp[0][0] = grid[0][0]
        for row in 1..<rows {
            dp[row][0] = dp[row-1][0] + grid[row][0]
        }
        for col in 1..<cols {
            dp[0][col] = dp[0][col-1] + grid[0][col]
        }
        
        // 根据状态公式，计算所有的结果
        for row in 1..<rows {
            for col in 1..<cols {
                dp[row][col] = min(dp[row-1][col],dp[row][col-1]) + grid[row][col]
            }
        }

        return dp[rows-1][cols-1]
    }
}
