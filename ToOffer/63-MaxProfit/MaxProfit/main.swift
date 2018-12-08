//
//  main.swift
//  MaxProfit
//
//  Created by Csy on 2018/12/8.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation


func maxProfit(_ nums: Array<Int>) -> Int {
    let count = nums.count
    if count < 2  {
        return 0
    }
    
    var min = nums[0] < nums[1] ? nums[0] : nums[1]
    var maxDiff = nums[1] - nums[0]
    
    for index in 2..<count {
        // 加入一个数之后，先算出该数为卖出价的话，最大的max
        // 再和之前的max进行比较
        let currentDiff = nums[index] - min
        if currentDiff > maxDiff {
            maxDiff = currentDiff
        }
        
        // 更新最小值
        if nums[index] < min {
            min = nums[index]
        }
    }
    
    return maxDiff
}

var nums1 = [9,11,8,5,7,12,16,14]
var result1 = maxProfit(nums1)
var nums2 = [9,8,7,6,5,4,3,1]
var result2 = maxProfit(nums2)
print(result2)
