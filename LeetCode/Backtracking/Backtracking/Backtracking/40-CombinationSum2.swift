//
//  40-CombinationSum2.swift
//  Backtracking
//
//  Created by Csy on 2019/2/22.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 candidates 中的每个数字在每个组合中只能使用一次。
 说明：
 
 所有数字（包括目标数）都是正整数。
 解集不能包含重复的组合。
 
 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 所求解集为:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]
 */

import Foundation

class CombinationSum2 {
    private var result = Array<Array<Int>>()
    private var resultSet = Set<Array<Int>>()
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        self.result.removeAll()
        self.resultSet.removeAll()
        
        if candidates.count == 0 || target <= 0 {
            return self.result
        }
        
        var nums = Array<Int>()
        let sortedNums = candidates.sorted()
        self.generateSum(sortedNums, target, 0, &nums)
        
        return self.result
    }
    
    /// - Parameters:
    ///   - candidates: 可选数字
    ///   - target: 目标数
    ///   - nums: 已选数字
    func generateSum(_ candidates: [Int], _ target: Int, _ start: Int, _ nums: inout [Int]) -> Void {
        // 已经找到
        if target == 0 {
            self.result.append(nums)
            return
        }
        
        // 这次组合不能找到
        let numCount = candidates.count
        if target < 0 || start == numCount  {
            return
        }
        
        for i in start..<numCount {
            let num = candidates[i]
            if num > target {
                continue
            }
            
            // 防止重复
            if i > start && candidates[i] == candidates[i-1] {
                continue
            }
            
            nums.append(num)
 
            self.generateSum(candidates, target-num, i+1, &nums)
            nums.removeLast()
        }
    }
}
