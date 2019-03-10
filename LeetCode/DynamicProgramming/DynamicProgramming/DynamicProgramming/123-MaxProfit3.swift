//
//  123-MaxProfit3.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/3/10.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。
 
 设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。
 
 注意: 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）
 
 输入: [3,3,5,0,0,3,1,4]
 输出: 6
 解释: 在第 4 天（股票价格 = 0）的时候买入，在第 6 天（股票价格 = 3）的时候卖出，这笔交易所能获得利润 = 3-0 = 3 。
 随后，在第 7 天（股票价格 = 1）的时候买入，在第 8 天 （股票价格 = 4）的时候卖出，这笔交易所能获得利润 = 4-1 = 3 。
 
 思路
    1 先计算[1,i]区间的最大利润
    2 再计算[i,n]区间的最大利润，倒序计算
    3 两个区间的利润加起来，计算最大值
 
 */

import Foundation

class MaxProfit3 {
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        if count < 2  {
            return 0
        }
        
        // 求出前半部分的最大利润
        var minPrice = prices[0]
        var profits1 = Array(repeating: 0, count: count)
        for i in 1...count-1 {
            let price = prices[i]
            
            profits1[i] = max(profits1[i-1], price - minPrice)
            minPrice = min(minPrice, price)
        }
        
        // 求出后半部分的最大利润
        var maxPrice = prices[count-1]
        var profits2 = Array(repeating: 0, count: count)
        for i in (0...count-2).reversed() {
            let price = prices[i]
            
            profits2[i] = max(profits2[i+1], maxPrice - price)
            maxPrice = max(maxPrice, price)
        }
        
        // 计算最大值
        var result = 0
        for i in 0..<count {
            result = max(result, profits1[i]+profits2[i])
        }
        
        return result
    }
}
