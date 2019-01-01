//
//  LCS.swift
//  DynamicProgramming
//
//  Created by Csy on 2018/12/28.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

/**
  dp[i][j] 表示 S1 的前 i 个字符与 S2 的前 j 个字符最长公共子序列的长度
  dp[i][j] = dp[i-1][j-1] + 1,当 S1i==S2j 时
  dp[i][j] = max{ dp[i-1][j], dp[i][j-1] }
 */
class  LongestCommonSubsequence {
    func solution1(_ str1: String, _ str2: String) -> Int {
        let length1 = str1.count
        let length2 = str2.count
        
        if length1 == 0 || length2 == 0 {
            return 0
        }
        
        // 初始化保存的数组
        let oneRow = Array(repeating: 0, count: length2)
        var dp = Array(repeating: oneRow, count: length1)
        // 初始化第一行数据
        
        for i in 0...(length1 - 1) {
            let iIndex = str1.index(str1.startIndex, offsetBy: i)
            for j in 0...(length2 - 1) {
                let jIndex = str2.index(str2.startIndex, offsetBy: j)
                
                // 先计算str1[i]，str2[j]
                let iValue = str1[iIndex]
                let jValue = str2[jIndex]
                
                if iValue == jValue {
                    if i >= 1 && j >= 1 {
                        dp[i][j] = dp[i-1][j-1] + 1
                    } else {
                        dp[i][j] = 1
                    }
                } else {
                    if i >= 1 && j >= 1 {
                        dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                    } else if i >= 1 {
                        dp[i][j] = dp[i - 1][j]
                    } else if j >= 1 {    // j >= 1
                        dp[i][j] = dp[i][j - 1]
                    }
                }
            }
        }
    
        return dp[length1 - 1][length2 - 1]
    }
    
    func solution2(_ str1: String, _ str2: String) -> Int {
        let length1 = str1.count
        let length2 = str2.count
        
        if length1 == 0 || length2 == 0 {
            return 0
        }
        
        // 初始化保存的数组，长度都用length+1，下面的计算就不用考虑边界条件了
        let oneRow = Array(repeating: 0, count: length2+1)
        var dp = Array(repeating: oneRow, count: length1+1)
        // 初始化第一行数据
        
        for i in 1...(length1) {
            let iIndex = str1.index(str1.startIndex, offsetBy: i-1)
            for j in 1...(length2) {
                let jIndex = str2.index(str2.startIndex, offsetBy: j-1)
                
                // 先计算str1[i]，str2[j]
                let iValue = str1[iIndex]
                let jValue = str2[jIndex]
                
                if iValue == jValue {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        return dp[length1][length2]
    }
}
