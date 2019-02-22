//
//  47-PermuteUnique.swift
//  Backtracking
//
//  Created by Csy on 2019/2/7.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个可包含重复数字的序列，返回所有不重复的全排列。
 输入: [1,1,2]
 输出:
 [
 [1,1,2],
 [1,2,1],
 [2,1,1]
 ]
 */

import Foundation

class PermuteUnique {
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
        
        // 去重
        var set = Set<Int>()
        
        for index in 0..<count {
            let num = nums[index]
            
            if !used[index] && !set.contains(num) {
                set.insert(num)
                used[index] = true
                perm.append(num)
                
                generatePermutation(nums, currentIndex+1, &perm)
                
                // 必须要返回去
                perm.removeLast()
                used[index] = false
            }
        }
    }
}
