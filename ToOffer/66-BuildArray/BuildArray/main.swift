//
//  main.swift
//  BuildArray
//
//  Created by Csy on 2018/12/9.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func buildArray(_ nums: Array<Int>) -> Array<Int> {
    let length = nums.count
    var result = Array<Int>()
    
    // result = C(i)*D(i)
    // 先构造数组C
    // [1,a0*1, a0*a1*1, a0*a1*a2*1, ....]
    result.append(1)
    for index in 1..<length {
        result.append(result[index - 1] * nums[index - 1])
    }
    
    // temp相当于D(i)
    // [..., a(n-2)*a(n-1)*1,a(n-1)*1,1]
    var temp = 1
    for index in (0...length-2).reversed() {
        temp = temp * nums[index + 1]
        
        // 结果相当于C(i)*D(i)
        result[index] = result[index] * temp
    }
    return result
}

var nums = [1,2,3,4,5]
var result = buildArray(nums)
print(result)
