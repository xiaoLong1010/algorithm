//
//  27-RemoveElement.swift
//  Array
//
//  Created by Csy on 2019/1/6.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 Given nums = [3,2,2,3], val = 3,
 
 Your function should return length = 2, with the first two elements of nums being 2.
 
 It doesn't matter what you leave beyond the returned length.
 
 */
import Foundation
class RemoveElement {
    func solution1(_ nums: inout [Int], _ val: Int) -> Int {
        var k = 0 // [0...k) 表示非val的数
        
        let length = nums.count
        for index in 0..<length {
            let num = nums[index]
            // 找到非val数，就看看是否需要交换
            if num != val {
                if index != k {
                    self.swap(&nums, index, k)
                }
                k = k + 1
            }
        }
        return k
    }
    
    func solution2(_ nums: inout [Int], _ val: Int) -> Int {
        var k = 0 // [0...k) 表示非val的数
        
        let length = nums.count
        for index in 0..<length {
            let num = nums[index]
            // 找到非val数，就放到[0...k)区间
            if num != val {
                nums[k] = num
                k = k + 1
            }
        }
        return k
    }
    
    func swap(_ nums: inout Array<Int>, _ index1: Int, _ index2: Int) -> Void {
        let temp = nums[index1]
        nums[index1] = nums[index2]
        nums[index2] = temp
    }
}
