//
//  121-MaxProfit1.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/3/10.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
 如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
 注意你不能在买入股票前卖出股票。
 
 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
 注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。

 
 */
import Foundation
class MaxProfit1 {
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        if count < 2  {
            return 0
        }
        
        // 保存最小值
        var minNum = prices[0] < prices[1] ? prices[0] : prices[1]
        var result = prices[1] - prices[0]
        if result < 0 {
            result = 0
        }
        
        for index in 2..<count {
            // 加入一个数之后，先算出该数为卖出价的话，最大的max
            // 再和之前的max进行比较
            result = max(result, prices[index] - minNum)
            
            // 更新最小值
            if prices[index] < minNum {
                minNum = prices[index]
            }
        }
        
        return result
    }
}

