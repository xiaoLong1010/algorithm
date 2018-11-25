//
//  main.swift
//  GreatestSumInArray
//
//  Created by Csy on 2018/11/25.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func greatestSum(_ nums: Array<Int>) -> Int {
    var currentSum = 0
    var greatestSum = Int.min
    
    for num in nums {
        if currentSum <= 0 {
            currentSum = num
        } else {
            currentSum += num
        }
        
        if currentSum > greatestSum {
            greatestSum = currentSum
        }
    }
    return greatestSum
}

var nums = [1,-2,3,10,-4,7,2,-5]
var sum = greatestSum(nums)
print(sum)


