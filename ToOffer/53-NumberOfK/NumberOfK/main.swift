//
//  main.swift
//  NumberOfK
//
//  Created by Csy on 2018/11/22.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation


func firstK(_ nums:Array<Int>, target: Int, start: Int, end: Int) -> Int {
    if start > end {
        return -1
    }
    
    let middle = (start + end) / 2
    let middleData = nums[middle]
    var newStart = start
    var newEnd = end
    
    // 根据二分法，找到第一个target
    if middleData == target {
        if (middle == 0) || (nums[middle - 1] != target) {
            return middle
        } else {
            newEnd = middle - 1
        }
    } else if middleData > target {
        newEnd = middle - 1
    } else {
        newStart = middle + 1
    }

    return firstK(nums, target: target, start: newStart, end: newEnd)
}

func lastK(_ nums:Array<Int>, target: Int, start: Int, end: Int) -> Int {
    if start > end {
        return -1
    }
    
    let middle = (start + end) / 2
    let middleData = nums[middle]
    var newStart = start
    var newEnd = end
    
    if middleData == target {
        if (middle == nums.count - 1) || nums[middle + 1] != target {
            return middle
        } else {
            newStart = middle + 1
        }
    } else if middleData > target {
        newEnd = middle - 1
    } else {
        newStart = middle + 1
    }
    
    return lastK(nums, target: target, start: newStart, end: newEnd)
}

func countOfK(_ nums: Array<Int>, target: Int) -> Int {
    let firstIndex = firstK(nums, target: target, start: 0, end: nums.count - 1)
    let endIndex = lastK(nums, target: target, start: 0, end: nums.count - 1)
    
    return endIndex - firstIndex + 1
}

// 数组中缺失的数字
func nonNum(_ nums: Array<Int>, start: Int, end: Int) -> Int {
    if start > end {
        return -1
    }
    
    let middle = (start + end) / 2
    let middleData = nums[middle]
    var newStart = start
    var newEnd = end
    
    // 根据二分法，
    if middleData == middle {
        if (middle < nums.count - 1) && nums[middle + 1] != (middle + 1) {
            return middle + 1
        } else {
            newStart = middle + 1
        }
    } else if middleData > middle {
        if (middle > 0) && nums[middle - 1] == (middle - 1) {
            return middle
        } else {
            newEnd = middle - 1
        }
    }
    
    return nonNum(nums, start: newStart, end: newEnd)
}

func missNum(_ nums: Array<Int>) -> Int {
    let length = nums.count
    
    var left = 0
    var right = length - 1
    
    while left <= right {
        let middle = (right + left) >> 1
        if nums[middle] != middle {
            if middle == 0 || (nums[middle - 1] == (middle - 1)) {
                return middle
            }
            right = middle - 1
        } else {
            left = middle + 1
        }
    }
    return left
}

var nums = [1,2,3,3,3,3,3,3,3,4,5]

var count = countOfK(nums, target: 3)
print(count)

nums = [0,1,2,3,4,5,6,7,8,10]
var num = nonNum(nums, start: 0, end: nums.count - 1)
print(num)

num = missNum(nums)
print(num)
