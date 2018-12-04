//
//  main.swift
//  SumInArray
//
//  Created by Csy on 2018/12/5.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func hasSum(_ sum: Int, inArray nums: Array<Int>) -> Bool {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let currentSum  = nums[left] + nums[right]
        
        if currentSum == sum {
            return true
        } else if currentSum > sum {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return false
}

func continuousSequence(_ sum: UInt) -> Void {
    var left = 1
    var right = 2
    var currentSum = left + right
    let middle = (sum + 1) >> 1
    
    while left < middle {
        if currentSum == sum {
            print(from: left, to: right)
            
            right += 1
            currentSum += right
        } else if currentSum > sum {
            currentSum -= left
            left += 1
        } else {
            right += 1
            currentSum += right
        }
    }
}

func print(from: Int, to: Int) -> Void {
    for num in from...to {
        print("\(num) ", terminator: "")
    }
    print("")
}

continuousSequence(15)
