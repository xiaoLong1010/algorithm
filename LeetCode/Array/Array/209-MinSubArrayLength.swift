//
//  209-MinSubArrayLength.swift
//  Array
//
//  Created by Csy on 2019/1/7.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation
/**
 209 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。
 输入: s = 7, nums = [2,3,1,2,4,3]
 输出: 2
 */
class MinSubArrayLength {
    func solution1(_ s: Int, _ nums: [Int]) -> Int {
        let length = nums.count
        if length < 2 {
            return 0
        }
        
        // 滑动窗口左右两个索引
        var left = 0
        var right = 0
        var sum = nums[0]
        var result = length+1     // 初始取最大值
        
        while right < length {
            if sum >= s {
                result = min(result, (right-left+1))
                
                if left < right {
                    sum -= nums[left]
                    left += 1
                } else {
                    right += 1
                    if right < length {
                        sum += nums[right]
                    }
                }
            } else {
                right += 1
                if right < length {
                    sum += nums[right]
                }
            }
        }
        
        // 没有找到合适的子数组
        if result == length+1 {
            return 0
        }
        return result
    }
}
