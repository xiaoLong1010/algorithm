//
//  42-Trap.swift
//  Array
//
//  Created by Csy on 2019/3/25.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水
 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 
 思路
    https://blog.csdn.net/qq_17550379/article/details/84945427
 
 */
import Foundation

class Trap {
    func trap(_ heights: [Int]) -> Int {
        let length = heights.count
        if length < 3 {
            return 0
        }
        
        var left = 0
        var right = length - 1
        var maxLeftHeight = 0
        var maxRightHeight = 0
        var result = 0
        
        while left < right {
            if heights[left] < heights[right] {
                if heights[left] >= maxLeftHeight {
                    maxLeftHeight = heights[left]
                }
                else {
                    result += (maxLeftHeight - heights[left])
                }
                left += 1
            }
            else {
                if heights[right] >= maxRightHeight {
                    maxRightHeight = heights[right]
                }
                else {
                    result += (maxRightHeight - heights[right])
                }
                right -= 1
            }
        }
        
        return result
    }
    
    // 计算不正确
    func trap2(_ heights: [Int]) -> Int {
        let length = heights.count
        if length < 3 {
            return 0
        }
        
        var startIndex = 0
        var result = 0
        while startIndex < length {
            // 首先确定起始点
            while startIndex < length && heights[startIndex] <= 0 {
                startIndex += 1
            }
            while startIndex+1 < length && heights[startIndex] <= heights[startIndex+1] {
                startIndex += 1
            }
            if startIndex+1 >= length {
                break
            }
            
            var aResult = 0
            let startHeight = heights[startIndex]
            
            // 确定最低点
            var minHeight = heights[startIndex]
            var minIndex = startIndex
            while minIndex+1 < length && minHeight >= heights[minIndex+1] {
                aResult += (startHeight - heights[minIndex+1])
                
                minHeight = heights[minIndex+1]
                minIndex = minIndex+1
            }
            if minIndex+1 >= length {
                break
            }
            
            // 确定结束点，结束高度需要大于最低点
            var endIndex = minIndex
            var endHeight = heights[endIndex]
            while endIndex+1 < length && endHeight < heights[endIndex+1] {
                endHeight = heights[endIndex+1]
                endIndex += 1
            }
            if endIndex < length {
                // 高度只能取最小值
                let height = min(startHeight, endHeight)
                for i in startIndex+1...endIndex-1 {
                    if heights[i] < height {
                        result += (height - heights[i])
                    }
                }
                startIndex = endIndex
            }
            else {
                startIndex += 1
            }
        }
        
        return result
    }
}
