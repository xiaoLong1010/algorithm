//
//  167-TwoSum2.swift
//  Array
//
//  Created by Csy on 2019/1/7.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

/**
 167 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
 numbers = [2, 7, 11, 15], target = 9
 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
 */
class TwoSum2 {
    func solution1(_ numbers: [Int], _ target: Int) -> [Int] {
        let length = numbers.count
        if length < 2 {
            return []
        }
        
        // 左右两个索引
        var left = 0
        var right = length - 1
        
        // 同target进行比较，移动左右索引
        while left < right {
            let sum = numbers[left] + numbers[right]
            
            if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            } else {
                return [left+1, right+1]
            }
        }
        return []
    }
}
