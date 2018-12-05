//
//  main.swift
//  ContinousCards
//
//  Created by Csy on 2018/12/6.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func isContinous(_ nums: Array<Int>) -> Bool {
    var sortedNums = nums.sorted()
    
    // 计算0的个数
    var countOfZero = 0
    for num in sortedNums {
        if num == 0 {
            countOfZero += 1
        }
    }
    
    // 计算数组中相邻两个数的间隔
    var left = countOfZero  // 从非0开始
    var right = countOfZero + 1
    let total = sortedNums.count
    while right < total {
        let leftValue = sortedNums[left]
        let rightValue  = sortedNums[right]
        
        // 相等，就不是顺子
        if leftValue == rightValue {
            return false
        }
        
        // 右边的数比左边的数大超过1，可以用0补
        let gap = rightValue - leftValue - 1
        countOfZero -= gap
        if countOfZero < 0 {
            return false
        }
        
        left += 1
        right += 1
    }
    return true
}

var result = isContinous([0,6,1,3,2])
print(result)

