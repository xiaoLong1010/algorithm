//
//  80-RemoveDulicatesTwo.swift
//  Array
//
//  Created by Csy on 2019/1/24.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素最多出现两次，返回移除后数组的新长度。
 
 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
 
 给定 nums = [1,1,1,2,2,3],
 
 函数应返回新长度 length = 5, 并且原数组的前五个元素被修改为 1, 1, 2, 2, 3 。
 
 你不需要考虑数组中超出新长度后面的元素
 
 */

import Foundation

class RemoveDulicatesTwo {
    func solution2(_ nums: inout [Int]) -> Int  {
        let length = nums.count
        guard length > 0 else {
            return 0
        }
        
        // [i,j]表示最后一个不同的元素所在的区间
        var i = 0
        var j = 0
        var k = 1
        
        while k < length  {
            let nextNum = nums[k]
            let num = nums[j]
            
            // 不相同，就把nextNum放到index1的下一个位置
            if nextNum != num {
                j += 1
                nums[j] = nextNum
                i = j
            } else {
                // 如果相同，就看看区间是否小于2
                if (j-i+1) < 2 {
                    j += 1
                    nums[j] = nextNum
                }
            }
            
            k += 1
        }
        
        return j + 1
    }
}
