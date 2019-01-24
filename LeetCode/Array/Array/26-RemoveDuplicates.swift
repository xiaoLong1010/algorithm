//
//  26-RemoveDuplicates.swift
//  Array
//
//  Created by Csy on 2019/1/24.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class RemoveDuplicates {
    
    func solution2(_ nums: inout [Int]) -> Int  {
        let length = nums.count
        guard length > 0 else {
            return 0
        }
        
        var index1 = 0  // [0,index1]都是不同的元素，index1指向最后一个不同的元素
        var index2 = 1
        
        while index2 < length  {
            let nextNum = nums[index2]
            let num = nums[index1]
            
            // 不相同，就把nextNum放到index1的下一个位置
            if nextNum != num {
                index1 += 1
                nums[index1] = nextNum
            }
            
            index2 += 1
        }
        
        return index1 + 1
    }
    
    func solution1(_ nums: inout [Int]) -> Int  {
        let length = nums.count
        guard length > 0 else {
            return 0
        }
        
        // 初始两个下标指向第一个数字
        // index2 每次先走，看和index1对应的值是否相同
        var index1 = 0
        var index2 = 0
        var count = 1
        
        while index2 + 1 < nums.count  {
            index2 += 1
            
            let nextNum = nums[index2]
            let num = nums[index1]
            
            // 相同，就把这个相同的元素删除
            if nextNum == num {
                nums.remove(at: index2)
                index2 -= 1
            } else {
                // 不同，index1就移动到index2元素
                index1 = index2
                count += 1
            }
        }
        return count
    }
}
