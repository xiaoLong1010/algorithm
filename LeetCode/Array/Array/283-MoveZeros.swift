//
//  283-MoveZeros.swift
//  Array
//
//  Created by Csy on 2019/1/6.
//  Copyright © 2019 CXL. All rights reserved.
//
/**
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 */
import Foundation
class MoveZeros {
    
    func solution1(_ nums: inout Array<Int>) -> Void {
        var k = 0   // [0...k)的元素都不是0
        
        let length = nums.count
        
        for index in 0..<length {
            let num = nums[index]
            // 找到非0数，就看看是否需要交换
            if num != 0 {
                if index != k {
                    self.swap(&nums, index, k)
                }
                k = k + 1
            }
        }
    }
    
    func swap(_ nums: inout Array<Int>, _ index1: Int, _ index2: Int) -> Void {
        let temp = nums[index1]
        nums[index1] = nums[index2]
        nums[index2] = temp
    }

    func solution2(_ nums: inout Array<Int>) -> Void {
        if nums.count <= 1 {
            return;
        }
        var zeroIndexs = Array<Int>()
        var count = 0;  // 值为0的数，在zeroIndexs的起点
        for i in 0..<nums.count {
            let val = nums[i]
            
            if val == 0 {
                zeroIndexs.append(i)
            } else {
                if zeroIndexs.count > 0 {
                    let zeroIndex = zeroIndexs[count]
                    nums[zeroIndex] = nums[i]
                    nums[i] = 0
                    zeroIndexs.append(i);
                    count += 1
                }
            }
        }
    }
}
