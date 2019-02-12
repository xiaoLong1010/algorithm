//
//  70-ClimbStairs.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/12.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

/**
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 注意：给定 n 是一个正整数
 
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 
 根据题目换算出来的公式
 f(n) = f(n-1) + f(n-2)
 假定f(0) = 1
 
 则dp[i]表示爬到第i楼的方法数
 */

class ClimbStairs {
    func solution1(_ n: Int) -> Int {
        if n < 0 {
            return 0
        }
        
        if n == 0 {
            return 1
        }
        
        if n == 1 {
            return 1
        }
        
        var dp = Array(repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        
        // 根据公式进行求解
        for i in 2...n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n]
    }
}
