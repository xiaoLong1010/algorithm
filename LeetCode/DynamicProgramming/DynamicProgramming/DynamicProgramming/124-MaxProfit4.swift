//
//  124-MaxProfit4.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/3/10.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。
 
 设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。
 
 注意: 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 
 dp1[i][j]表示第i天必须卖掉，至多进行j次交易
 dp2[i][j]表示第i天不一定卖掉，至多进行j次交易
 
 dp1[i][j] =
 
 */

import Foundation

class MaxProfit4 {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let count = prices.count
        if count < 2  {
            return 0
        }
        
        if k < 1 {
            return 0
        }
        
        // 如果交易数大于天数，那就变成MaxProfit2问题
        if k >= count {
            return self.maxProfit2(prices)
        }
        
        // 初始化
        let oneRow = Array(repeating: 0, count: k+1)
        var dp1 = Array(repeating: oneRow, count: count)
        var dp2 = Array(repeating: oneRow, count: count)
        
        for i in 1...count-1 {
            let diff = prices[i] - prices[i-1]
            for j in 1...k {
                dp1[i][j] = max(dp2[i-1][j-1]+max(diff, 0), dp1[i-1][j]+diff)
                dp2[i][j] = max(dp2[i-1][j], dp1[i][j])
            }
        }
        
        return dp2[count-1][k]
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        let count = prices.count
        if count < 2  {
            return 0
        }
        
        // 保存最小值
        var result = 0
        for i in 1..<count {
            let price1 = prices[i-1]
            let price2 = prices[i]
            
            if price2 > price1 {
                result += (price2 - price1)
            }
        }
        
        return result
    }
}
