//
//  78-Subsets.swift
//  Backtracking
//
//  Created by Csy on 2019/2/22.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 说明：解集不能包含重复的子集。
 
 输入: nums = [1,2,3]
 输出:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 
 思路
    - 依次计算，从nums选出0个数，1个数，2个数组合
    - 先计算从nums选出count个数的组合的方法
 */

import Foundation

class Subsets {
    private var results = Array<Array<Int>>()
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        let numCount = nums.count
        var previousNums = [Int]()
        
        for count in 0...numCount {
            self.subsetsCore(nums, count, 0, &previousNums)
        }
        
        return self.results
    }
    
    /// - Parameters:
    ///   - nums: 所有的可选数
    ///   - count: 从nums中，选择数字的个数
    ///   - start: nums中的起始下标
    ///   - previousNums: 之前已经选好的数字
    func subsetsCore(_ nums: [Int], _ count: Int, _ start: Int, _ previousNums: inout [Int]) -> Void {
        if previousNums.count == count {
            self.results.append(previousNums)
            return
        }
        let numCount = nums.count
        
        for i in start..<numCount {
            previousNums.append(nums[i])
            self.subsetsCore(nums, count, i+1, &previousNums)
            previousNums.removeLast()
        }
    }
}
