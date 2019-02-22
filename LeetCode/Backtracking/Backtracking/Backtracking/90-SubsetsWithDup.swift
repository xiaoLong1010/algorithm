//
//  90-SubsetsWithDup.swift
//  Backtracking
//
//  Created by Csy on 2019/2/22.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个可能包含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 说明：解集不能包含重复的子集。
 
 示例:
 输入: [1,2,2]
 输出:
 [
 [2],
 [1],
 [1,2,2],
 [2,2],
 [1,2],
 []
 ]
 
 思路
    根据78题，进行去重
 */

import Foundation

class SubsetsWithDup {
    private var results = Array<Array<Int>>()
    
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let numCount = nums.count
        var previousNums = [Int]()
        let sortedNums = nums.sorted()
        
        for count in 0...numCount {
            self.subsetsCore(sortedNums, count, 0, &previousNums)
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
            if i > start && nums[i] == nums[i-1] {
                continue
            }
            previousNums.append(nums[i])
            self.subsetsCore(nums, count, i+1, &previousNums)
            previousNums.removeLast()
        }
    }
}
