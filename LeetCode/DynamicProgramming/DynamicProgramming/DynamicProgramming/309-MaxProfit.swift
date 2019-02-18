//
//  309-MaxProfit.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/18.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个整数数组，其中第 i 个元素代表了第 i 天的股票价格 。
 
 设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:
 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
 
 未持有股票dp1和持有股票两种状态dp2
 
 首先是当天未持有股票状态dp1，当天未持有股票的话，则分为两种情况：
    1 昨天也未持有，
    2 或者昨天持有股票，今天卖出。由此得出状态转移方程：
 dp1[i] = max(dp[i - 1], dp2[i - 1]+price[i])
 
 当天持有股票状态dp2，当天持有股票的话，则分为两种情况，
    1 一是昨天持有股票，今天未卖；。
    2 二是昨天未持有股票，今天买入。
 
 注意第二种情况，由于存在冷冻期，今天买入则今天一定没有在冷冻期，要确定今天没有在冷冻期，则昨天不能卖出股票，也未持有股票。dp1[i-1] 只能表示昨天没有持有股票，不能表示昨天没有卖出股票，所以要根据前天的状态来确定今天不在冷冻期。
 若前天未持有股票的话，则今天一定不再冷冻期。由此可得状态转移方程
    dp2[i] = max(dp2[i - 1], dp1[i - 2] - price[i])
 
 同样的由于冷冻期的存在，则若在第一天，第二天（i =1和i=2）时，当天持有股票的利润一定是 0 - price[i]，因为之前的时间不足以购买股票
 */

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        if count <= 1 {
            return 0
        }
        
        if count == 2 {
            let profit = prices[1] - prices[0]
            return profit > 0 ? profit : 0
        }
        
        // dp1当天未持有，dp2当天持有
        var dp1 = [Int](repeating: 0, count: count)
        var dp2 = [Int](repeating: 0, count: count)
        dp2[0] = -prices[0]
        
        for i in 1..<count {
            // 计算dp1
            dp1[i] = max(dp1[i-1], dp2[i-1]+prices[i])
            
            // 计算dp2
            let num1 = dp2[i-1]
            let num2 = ((i>=2) ? dp1[i-2] : 0) - prices[i]
            dp2[i] = max(num1, num2)
        }
        
        return max(dp1[count-1], dp2[count-2])
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }
        var s0: Int = 0
        var s1: Int = -prices[0]
        var s2: Int = Int.min
        for i in 1 ..< prices.count {
            let pre0 = s0
            let pre1 = s1
            let pre2 = s2
            s0 = max(pre0, pre2)
            s1 = max(pre0 - prices[i], pre1)
            s2 = pre1 + prices[i]
        }
        return max(s0, s2)
    }
}
