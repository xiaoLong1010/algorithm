//
//  279-NumSquares.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/12.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
 
 输入: n = 12
 输出: 3
 解释: 12 = 4 + 4 + 4.
 
 dp[i]表示组成的最小个数
 dp[i] = min(dp[i], dp[i-j*j])
 */

import Foundation

class NumSquares {
    func solution1(_ n: Int) -> Int {
        if n <= 0  {
            return 0
        }
        
        // dp的取值，初始化为最大值
        var dp = Array(repeating: n, count: n+1)
        dp[0] = 0
        
        for i in 1...n {
            var j = 1
            var small = i - j * j
            
            while small >= 0 {
                dp[i] = min(dp[i], dp[small] + 1)
                
                // 下一个更小的数
                j += 1
                small = i - j * j
            }
        }
        
        return dp[n]
    }
    
    func solution2(_ n: Int) -> Int {
        var dp = Array(repeating: n, count: n+1)
        dp[0] = 0
        
        for i in 0...n {
            var j = 1
            var num = i + j * j
            
            while num <= n {
                dp[num] = min(dp[num], dp[i] + 1)
                j += 1
                num = i + j * j
            }
        }
        
        return dp[n]
    }
    

    
    func solution3(_ n: Int) -> Int {
        var dp: [Int] = [Int](repeating: Int.max, count: n+1)
        dp[0] = 0
        for i in 0...n {
            var j = 1
            while i + j * j <= n {
                dp[i + j * j] = min(dp[i] + 1, dp[i + j * j])
                j += 1
            }
        }
        
        return dp[n]
    }
}
