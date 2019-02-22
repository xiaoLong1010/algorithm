//
//  39-CombinationSum.swift
//  Backtracking
//
//  Created by Csy on 2019/2/7.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 candidates 中的数字可以无限制重复被选取。
 说明：
 
 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 
 示例1
 输入: candidates = [2,3,6,7], target = 7,
 所求解集为:
 [
 [7],
 [2,2,3]
 ]
 
 */

import Foundation

class CombinationSum {
    private var result = Array<Array<Int>>()
    
    func solution1(_ candidates: [Int], _ target: Int) -> [[Int]] {
        self.result.removeAll()
        
        if candidates.count == 0 || target <= 0 {
            return self.result
        }
        
        var nums = Array<Int>()
        self.generateSum2(candidates, target, 0, &nums)
        
        return self.result
    }
    
    /// - Parameters:
    ///   - candidates: 可选数字
    ///   - target: 目标数
    ///   - nums: 已选数字
    func generateSum2(_ candidates: [Int], _ target: Int, _ start: Int, _ nums: inout [Int]) -> Void {
        // 已经找到
        if target == 0 {
            self.result.append(nums)
            return
        }
        
        // 这次组合不能找到
        if target < 0 {
            return
        }
        
        for i in start..<candidates.count {
            let num = candidates[i]
            if num > target {
                continue
            }
            nums.append(num)
            //数字可以重复选择，所以还是可以从i开始。
            self.generateSum2(candidates, target-num, i, &nums)
            nums.removeLast()
        }
    }
    
    // 计算的结果有重复的
    func generateSum(_ candidates: [Int], _ target: Int, _ nums: inout [Int]) -> Void {
        // 已经找到
        if target == 0 {
            self.result.append(nums)
            return
        }
        
        // 这次组合不能找到
        if target < 0 {
            return
        }
        
        // 由于可以重复地取数字，每次都是直接遍历所有的可选数字
        for aNum in candidates {
            nums.append(aNum)
            self.generateSum(candidates, target-aNum, &nums)
            nums.removeLast()
        }
    }
}
