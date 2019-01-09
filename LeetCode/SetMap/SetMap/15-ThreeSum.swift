//
//  15-ThreeSum.swift
//  SetMap
//
//  Created by Csy on 2019/1/9.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 满足要求的三元组集合为：
 [
    [-1, 0, 1],
    [-1, -1, 2]
 ]
 */

import Foundation

class ThreeSum {
    /**
     1. 必须先对数组进行排序(不排序的话，就不能利用双指针的思想了，所以说对数组进行排序是个大前提)，
     2. 每次固定i的位置，并利用两个指针j和k，分别指向数组的i+1位置和数组的尾元素，
     3. 通过判断num[j]+num[k]与-num[i]的大小，来决定如何移动指针j和k
     */
    func solution1(_ nums: [Int]) -> [[Int]] {
        let length = nums.count
        guard length > 2 else {
            return []
        }
        
        var result = [[Int]]()
        
        // 首先排序
        var nums = nums.sorted()
        
        for i in 0...length-3 {
            // 防止拿到重复结果
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            
            // 初始化j和k
            var j = i + 1
            var k = length - 1
            
            while j < k {
                // 求和
                let a = nums[i]
                let b = nums[j]
                let c = nums[k]
                let sum = a + b + c
                
                if sum == 0 {
                    // 保存结果
                    result.append([a,b,c])
                    
                    // 移动j和k，再计算sum值
                    j += 1
                    k -= 1
                    
                    // 移动j，并且防止重复值
                    while j < k && nums[j] == nums[j-1] {
                        j += 1
                    }
                    
                    // 移动k,并且防止重复值
                    while j < k && nums[k] == nums[k+1] {
                        k -= 1
                    }
                    
                } else if sum > 0 {
                    k -= 1
                } else {
                    j += 1
                }
            }
        }
        
        return result
    }
}
