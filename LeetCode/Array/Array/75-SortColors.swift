//
//  75-SortColors.swift
//  Array
//
//  Created by Csy on 2019/1/6.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 输入: [2,0,2,1,1,0]
 输出: [0,0,1,1,2,2]
 */
import Foundation

class SortColors {
    func solution2(_ nums: inout [Int]) -> Void {
        var zeroIndex = -1  // [0...zeroIndex]都是0
        var twoIndex = nums.count   // [twoIndex...length-1]都是2
        
        var index = 0
        while index < twoIndex {
            let num = nums[index]
            
            if num == 1 {
                index = index + 1
            } else if num == 2 {
                twoIndex = twoIndex - 1
                if index != twoIndex {
                    (nums[index],nums[twoIndex]) = (nums[twoIndex], nums[index])
                }
            } else {
                zeroIndex = zeroIndex + 1
                if zeroIndex != index {
                    (nums[index],nums[zeroIndex]) = (nums[zeroIndex], nums[index])
                }
                index = index + 1
            }
        }
    }
    
    func solution1(_ nums: inout [Int]) -> Void {
        var zeroIndex = -1  // [0...zeroIndex]都是0
        var twoIndex = nums.count   // [twoIndex...length-1]都是2
        
        var index = 0
        while index < twoIndex {
            let num = nums[index]
            
            if num == 1 {
                index = index + 1
            } else if num == 2 {
                twoIndex = twoIndex - 1
                if index != twoIndex {
                    self.swap(&nums, index, twoIndex)
                }
            } else {
                zeroIndex = zeroIndex + 1
                if zeroIndex != index {
                    self.swap(&nums, zeroIndex, index)
                }
                index = index + 1
            }
        }
    }
    
    func swap(_ nums: inout Array<Int>, _ index1: Int, _ index2: Int) -> Void {
        let temp = nums[index1]
        nums[index1] = nums[index2]
        nums[index2] = temp
    }
}
