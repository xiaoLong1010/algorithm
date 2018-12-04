//
//  main.swift
//  MinInSortArray
//
//  Created by Csy on 2018/11/26.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func min(_ nums: inout Array<Int>) -> Void {
    quickSort(&nums, left: 0, right: nums.count - 1)
    
    for num in nums {
        print(num, terminator: "")
    }
    print("")
}

func quickSort(_ nums: inout Array<Int>, left: Int, right: Int) -> Void {
    if left >= right {
        return
    }
    
    let index = partition(&nums, left: left, right: right)
    quickSort(&nums, left: left, right: index - 1)
    quickSort(&nums, left: index + 1, right: right)
}

func partition(_ nums: inout Array<Int>, left: Int, right: Int) -> Int {
    
    var left = left
    var right = right
    
    // 取最右边的数放到中间
    let middleData = nums[right]
    
    while left < right {
        // 从左边找到了大于middleData的数，放到右边
        while left < right && bigger(middleData, nums[left]) {
            left += 1
        }
        nums[right] = nums[left]
        
        // 从右边找到了小于middleData的数，放到左边
        while left < right &&
            (bigger(nums[right], middleData) || (nums[right] == middleData)) {
                
            right -= 1
        }
        nums[left] = nums[right]
    }
    
    // middleData放到中间位置
    nums[right] = middleData
    return right
}

// 定义比较大小的规则
func bigger(_ num1: Int, _ num2: Int) -> Bool {
    let numStr1 = "\(num1)\(num2)"
    let numStr2 = "\(num2)\(num1)"
    
    let result = numStr1 > numStr2
    
    return result
}

//var num1 = 123
//var num2 = 4
//var result = bigger(num1, num2)

var nums = [3,32,321,12345]
min(&nums)



