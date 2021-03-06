//
//  46-Permutations.swift
//  Backtracking
//
//  Created by Csy on 2018/12/22.
//  Copyright © 2018 CXL. All rights reserved.
//

/**
 给定一个没有重复数字的序列，返回其所有可能的全排列。
 输入: [1,2,3]
 输出:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 */

import Foundation

class Permutations {
    private var result = Array<Array<Int>>()
    private var used = Array<Bool>()
    
    func permute(_ nums: Array<Int>) -> Array<Array<Int>> {
        if nums.count == 0 {
            return self.result
        }
        self.used = Array<Bool>(repeating: false, count: nums.count)
        
        var perm = Array<Int>()
        self.result.removeAll()
        
        self.generatePermutation(nums, 0, &perm)
        
        return self.result
    }
    
    // nums是总的数字列表
    // perm是0到index-1，已经全排列的
    func generatePermutation(_ nums: Array<Int>, _ currentIndex: Int, _ perm: inout Array<Int>) -> Void {
        // 全排列已经完成了
        if currentIndex == nums.count {
            self.result.append(perm)
            return
        }
        let count = nums.count
        for index in 0..<count {
            if !used[index] {
                used[index] = true
                perm.append(nums[index])
                generatePermutation(nums, currentIndex+1, &perm)
                
                // 必须要回去
                perm.removeLast()
                used[index] = false
            }
        }
    }
}
