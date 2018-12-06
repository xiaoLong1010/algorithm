//
//  main.swift
//  LastNumberInCircle
//
//  Created by Csy on 2018/12/7.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func lastNum(_ count: UInt, m: UInt) -> UInt {
    var count = count
    var nums = Array<UInt>()
    var start = 0   // 开始找的起点
    
    
    // 使用数组模拟循环链表
    for num in 0..<count {
        nums.append(num)
    }
    
    while count > 1 {
        // 走m-1步,指向要删除的index
        for _ in 1...m-1 {
            start += 1
            // 超出数组了，下标就变成0
            if start == count {
                start = 0
            }
        }
        
        nums.remove(at: start)      // 删除之后，start自动指向下一次开始的起点了
        count -= 1
        if start == count {
            start = 0
        }
    }
    return nums[0]
}

var result = lastNum(5, m: 3)
print(result)


