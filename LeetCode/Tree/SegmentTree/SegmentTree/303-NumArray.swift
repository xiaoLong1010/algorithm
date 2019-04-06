//
//  303-NumArray.swift
//  SegmentTree
//
//  Created by Csy on 2019/4/6.
//  Copyright © 2019 ChenLong. All rights reserved.
//

/**
 给定一个整数数组  nums，求出数组从索引 i 到 j  (i ≤ j) 范围内元素的总和，包含 i,  j 两点。
 
 给定 nums = [-2, 0, 3, -5, 2, -1]，求和函数为 sumRange()
 
 sumRange(0, 2) -> 1
 sumRange(2, 5) -> -1
 sumRange(0, 5) -> -3
 
 */

import Foundation

class NumArray {
    // data[i]表示区间[0,i]的和
    private var data: [Int]
    
    init(_ nums: [Int]) {
        self.data = [Int]()
        if nums.count > 0 {
            self.data.append(nums[0])
            var i = 1
            while i < nums.count {
                self.data.append(self.data[i-1] + nums[i])
                i += 1
            }
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if self.data.count > 0 {
            if i > 0 {
                return self.data[j] - self.data[i-1]
            }
            return self.data[j]
        }
        return 0
    }
}
