//
//  63-UniquePathsWithObstacles.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/17.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 
 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 
 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
 
 dp[i][j]表示起点到[i,j]的路径数,
 dp[i][j] = dp[i-1][j]+dp[i][j-1]
 如果v[i][j] = 1, dp[i][j] = 0
 
 */

import Foundation

class UniquePathsWithObstacles {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let rows = obstacleGrid.count
        guard rows > 0 else {
            return 0
        }
        
        let cols = obstacleGrid[0].count
        guard cols > 0 else {
            return 0
        }
        
        // 左上角是障碍物，直接返回0
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        
        // 初始化dp,如果有障碍，路径数等于0
        var dp = Array(repeating:Array(repeating:-1,count:cols),count:rows)
        dp[0][0] = 1
        for row in 1..<rows {
            dp[row][0] = (obstacleGrid[row][0] == 1 ? 0 : dp[row-1][0])
        }
        for col in 1..<cols {
            dp[0][col] = (obstacleGrid[0][col] == 1 ? 0 : dp[0][col-1])
        }
        
        // 根据状态公式，计算所有的结果
        for row in 1..<rows {
            for col in 1..<cols {
                dp[row][col] = (obstacleGrid[row][col] == 1 ? 0 : (dp[row-1][col] + dp[row][col-1]))
            }
        }
        
        return dp[rows-1][cols-1]
    }
}
