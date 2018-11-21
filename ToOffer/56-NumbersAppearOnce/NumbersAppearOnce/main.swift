//
//  main.swift
//  NumbersAppearOnce
//
//  Created by Csy on 2018/11/21.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func numbersAppearOnce(_ nums: Array<Int>) -> Array<Int> {
    // 所有的数字进行异或
    var xorResult = 0
    for num in nums {
        xorResult = xorResult ^ num
    }
    
    // 求出第一个bit为1的mask
    let mask = maskInFirstOne(xorResult)
    
    // 根据mask的值，把数字分到两个数组
    var firstList = Array<Int>()
    var secondList = Array<Int>()
    for num in nums {
        if (num & mask) != 0 {
            firstList.append(num)
        } else {
            secondList.append(num)
        }
    }
    
    // 求出两个只出现1次的数字
    var first = 0
    for num in firstList {
        first = first ^ num
    }
    var second = 0
    for num in secondList {
        second = second ^ num
    }
    
    return [first, second]
}


// num中第一个bit为1
func maskInFirstOne(_ num: Int) -> Int {
    var mask = 1
    while (mask & num) == 0 {
        mask = mask << 1
    }
    return mask
}

var nums = [2,4,3,6,3,2,5,5]
var result = numbersAppearOnce(nums)

var num = 0b1101001000
var mask = maskInFirstOne(num)



