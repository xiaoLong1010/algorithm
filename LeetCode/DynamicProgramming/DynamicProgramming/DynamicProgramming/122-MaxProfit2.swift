//
//  122-MaxProfit2.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/3/10.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 
 输入: [7,1,5,3,6,4]
 输出: 7
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
 随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
 
 */

import Foundation

class MaxProfit2 {
    func maxProfit(_ prices: [Int]) -> Int {
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
