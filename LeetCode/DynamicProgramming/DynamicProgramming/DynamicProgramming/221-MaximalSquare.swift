//
//  221-MaximalSquare.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/3/28.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。
 示例:
 输入:

 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0
 
 输出: 4
 
 思路
    1 dp[i][j]表示，[i][j]的矩阵中，以点[i][j]结尾的最大正方形的边长
    // 如果dp[i-1][j-1],dp[i][j-1],dp[i-1][j]都大于0，则组成的正方形，只能以最小长度的为准
    // 如果其中有一个等于0，则只能v[i][j]本身组成正方形了
    2 dp[i][j] = 1 + min(dp[i-1][j-1],dp[i][j-1],dp[i-1][j])，如果v[i][j]=1
 */

import Foundation

class MaximalSquare {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let rowCount = matrix.count
        if rowCount == 0 {
            return 0
        }
        let colCount = matrix[0].count
        
        // 先初始化dp
        let oneRow = Array(repeating: 0, count: colCount)
        var dp = Array(repeating: oneRow, count: rowCount)
        var maxLength = 0
        // 初始化第0行
        for i in 0..<colCount {
            dp[0][i] = (matrix[0][i] == "1") ? 1 : 0
            maxLength = max(maxLength, dp[0][i])
        }
        // 初始化第0列
        for i in 0..<rowCount {
            dp[i][0] = (matrix[i][0] == "1") ? 1 : 0
            maxLength = max(maxLength, dp[i][0])
        }
        if colCount == 1 || rowCount == 1 {
            return maxLength * maxLength
        }
        
        // 根据状态方程进行求解
        for i in 1..<rowCount {
            for j in 1..<colCount {
                if matrix[i][j] == "1" {
                    // 如果dp[i-1][j-1],dp[i][j-1],dp[i-1][j]都大于0，则组成的正方形，只能以最小长度的为准
                    // 如果其中有一个等于0，则只能v[i][j]本身组成正方形了
                    dp[i][j] = 1 + min(dp[i-1][j-1], dp[i][j-1],dp[i-1][j])
                }
                maxLength = max(maxLength, dp[i][j])
            }
        }
        
        return maxLength * maxLength
    }
}
