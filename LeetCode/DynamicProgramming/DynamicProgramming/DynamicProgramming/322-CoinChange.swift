//
//  322-CoinChange.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/12.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。
 
 输入: coins = [1, 2, 5], amount = 11
 输出: 3
 解释: 11 = 5 + 5 + 1
 
 输入: coins = [2], amount = 3
 输出: -1
 
 
 dp[i]表示凑成金额i，最小需要的硬币个数
 
 */
import Foundation

class CoinChange {
    func solution1(_ coins: [Int], _ amount: Int) -> Int {
        let maxSum = amount+1
        var dp = Array(repeating: maxSum, count: amount+1)
        dp[0] = 0
        
        for i in 0...amount {
            for c in coins {
                if i >= c {
                    dp[i] = min(dp[i], dp[i-c]+1)
                }
            }
        }
        
        return dp[amount] == maxSum ? -1 : dp[amount]
    }

    func solution3(_ coins: [Int], _ amount: Int) -> Int {
        let maxSum = amount+1
        var dp = Array(repeating: maxSum, count: amount+1)
        dp[0] = 0
        
        for i in 0...amount {
            for c in coins {
                if i+c <= amount {
                    dp[i+c] = min(dp[i+c], dp[i]+1)
                }
            }
        }
        
        return dp[amount] == maxSum ? -1 : dp[amount]
    }
    
    // 这个最快
    func solution2(_ coins: [Int], _ amount: Int) -> Int {
        
        var dp = Array(repeating: -1, count: amount+1)
        dp[0] = 0
        
        for i in 0...amount {
            if dp[i] == -1 {
                continue
            }
            
            for c in coins {
                if i+c > amount {
                    continue
                }
                if dp[i+c] == -1 || dp[i+c] > dp[i] + 1 {
                    dp[i + c] = dp[i] + 1
                }
            }
        }
        
        return dp[amount]
    }
}
