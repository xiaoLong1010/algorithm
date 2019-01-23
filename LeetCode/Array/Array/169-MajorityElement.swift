//
//  169-MajorityElement.swift
//  Array
//
//  Created by Csy on 2019/1/23.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class MajorityElement {
    func solution1(_ nums: [Int]) -> Int {
        var result = nums[0]
        var times = 0
        
        // 记录每个数字出现的次数，如果出现了另外一个数字，times就减1
        // 最后留下来的一定是出现次数大于数组一半的数
        for num in nums {
            if result == num {
                times += 1
            } else {
                times -= 1
                if times == 0 {
                    result = num
                    times += 1
                }
            }
        }
        return result
    }
    
    func solution2(_ nums: inout Array<Int>) -> Int {
        let length = nums.count
        var start = 0
        var end = length - 1
        let middle = length >> 1
        
        var index = partition(&nums, start: start, end: end)
        
        while index != middle {
            if index > middle {
                end = index - 1
                index = partition(&nums, start: start, end: end)
            } else {
                start = index + 1
                index = partition(&nums, start: start, end: end)
            }
        }
        return nums[index]
    }
    
    func partition(_ nums: inout Array<Int>, start: Int, end: Int) -> Int {
        var start = start
        var end = end
        
        let middleData = nums[end]
        
        while start < end {
            // 从左边找到了大于middleData的数，放到右边
            while start < end && nums[start] < middleData {
                start += 1
            }
            nums[end] = nums[start]
            
            // 从右边找到了小于middleData的数，放到左边
            while start < end && middleData <= nums[end] {
                end -= 1
            }
            nums[start] = nums[end]
        }
        
        // middleData放到中间位置
        nums[end] = middleData
        return end
    }
    
    
}
