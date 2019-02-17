//
//  62-UniquePaths.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/17.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 
 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 
 问总共有多少条不同的路径？
 
 
 dp[i][j]表示起点到[i,j]的路径数
 dp[i][j] = dp[i-1][j], dp[i][j-1]
 
 */

import Foundation

class UniquePaths {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0 && n > 0 else {
            return 0
        }
        let rows = m
        let cols = n
        
        // 初始化dp
        var dp = Array(repeating:Array(repeating:0,count:cols),count:rows)
        dp[0][0] = 1
        for row in 1..<rows {
            dp[row][0] = 1
        }
        for col in 1..<cols {
            dp[0][col] = 1
        }
        
        // 根据状态公式，计算所有的结果
        for row in 1..<rows {
            for col in 1..<cols {
                dp[row][col] = dp[row-1][col] + dp[row][col-1]
            }
        }
        
        return dp[rows-1][cols-1]
    }
}
