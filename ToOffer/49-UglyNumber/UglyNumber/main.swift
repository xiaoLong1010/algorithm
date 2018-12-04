//
//  main.swift
//  UglyNumber
//
//  Created by Csy on 2018/12/4.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func isUglyNum(_ num: Int) -> Bool {
    var num = num
    
    // 能被2整除
    while (num % 2) == 0 {
        num /= 2
    }
    while (num % 3) == 0 {
        num /= 3
    }
    while (num % 5) == 0 {
        num /= 5
    }
    
    if num == 1 {
        return true
    }
    return false
}

func uglyNum(_ count: Int) -> Int {
    var nums = Array<Int>()
    nums.append(1)
    var nextIndex = 1
    
    var index_2 = 0
    var index_3 = 0
    var index_5 = 0
    
    while nextIndex < count {
        let nextValue = minNum(nums[index_2] * 2,
                               nums[index_3] * 3,
                               nums[index_5] * 5)
        nums.append(nextValue)
        
        // 找到合适的位置
        while nums[index_2] * 2 <= nextValue {
            index_2 += 1
        }
        while nums[index_3] * 3 <= nextValue {
            index_3 += 1
        }
        while nums[index_5] * 5 <= nextValue {
            index_5 += 1
        }
        
        nextIndex += 1
    }
    return nums[nextIndex - 1]
}

func minNum(_ num1: Int, _ num2: Int, _ num3: Int) -> Int {
    var min = num1 > num2 ? num2 : num1
    min = min > num3 ? num3 : min
    return min
}

var num1 = uglyNum(11)
var num2 = uglyNum(1500)
print("")

