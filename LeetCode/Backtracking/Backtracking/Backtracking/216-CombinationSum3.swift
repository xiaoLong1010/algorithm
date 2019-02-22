//
//  216-CombinationSum3.swift
//  Backtracking
//
//  Created by Csy on 2019/2/22.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 找出所有相加之和为 n 的 k 个数的组合。组合中只允许含有 1 - 9 的正整数，并且每种组合中不存在重复的数字。
 说明：
 
 所有数字都是正整数。
 解集不能包含重复的组合
 
 输入: k = 3, n = 7
 输出: [[1,2,4]]
 
 输入: k = 3, n = 9
 输出: [[1,2,6], [1,3,5], [2,3,4]]
 
 */

import Foundation

class CombinationSum3 {
    private var results = Array<Array<Int>>()
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        self.results.removeAll()
        var nums = Array<Int>()
        
        self.combinationCore(9, 1, n, k, &nums)
        
        return self.results
    }
    
    /// - Parameters:
    ///   - maxNum: 表示1-maxNum区间
    ///   - startNum: 起始数字
    ///   - target: 目标和
    ///   - count: 多少个数字，累加的目标和
    ///   - previousNums: 之前的结果
    func combinationCore(_ maxNum: Int, _ startNum: Int, _ target: Int, _ count: Int, _ previousNums: inout [Int]) -> Void {
        if target == 0 {
            if count == 0 {
                self.results.append(previousNums)
            }
            return
        }
        if startNum > maxNum || target < 0 || count <= 0 {
            return
        }
        
        // 剪枝，保证start到max，至少有count个数字
        let maxCount = maxNum-count+1
        if  startNum > maxCount {
            return
        }
        for num in startNum...maxCount {
            if num > target {
                break
            }
            previousNums.append(num)
            self.combinationCore(maxNum, num+1, target-num, count-1, &previousNums)
            previousNums.removeLast()
        }
    }
}
