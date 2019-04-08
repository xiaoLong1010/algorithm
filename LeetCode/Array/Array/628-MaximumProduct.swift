//
//  628-MaximumProduct.swift
//  Array
//
//  Created by Csy on 2019/4/8.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个整型数组，在数组中找出由三个数组成的最大乘积，并输出这个乘积。
 
 时间复杂度O(n)，空间复杂度1
 
 思路1
    1 前3个最大值，和倒数两个最小值，
    1 3个最大值乘积，两个最小值和最大值的乘积
 思路2
    1 升序排序
    2 依次讨论前三个，后三个，以及后两个跟第一个，前两个跟最后一个
 */

import Foundation

class MaximumProduct {
    func maximumProduct(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            return 0
        }
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        var min1 = Int.max
        var min2 = Int.max
        
        for num in nums {
            // 先更新最大值
            if num > max1 {
                (max1, max2, max3) = (num, max1, max2)
            }
            else if num > max2 {
                (max2, max3) = (num, max2)
            }
            else if num > max3 {
                max3 = num
            }
            
            // 更新最小值
            if num < min1 {
                (min1, min2) = (num, min1)
            }
            else if num < min2 {
                min2 = num
            }
        }
        
        return max(max1 * max2 * max3, min1 * min2 * max1)
    }
    
    // 时间复杂度太高
    func maximumProduct2(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            return 0
        }
        
        var sortedNums = nums.sorted()
        let count = sortedNums.count
        
        let max1 = sortedNums[count-1]
        let max2 = sortedNums[count-2]
        let max3 = sortedNums[count-3]
        let min1 = sortedNums[0]
        let min2 = sortedNums[1]
        
        return max(max1 * max2 * max3, min1 * min2 * max1)
    }
}

