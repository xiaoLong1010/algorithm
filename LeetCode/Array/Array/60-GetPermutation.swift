//
//  60-GetPermutation.swift
//  Backtracking
//
//  Created by Csy on 2019/3/25.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给出集合 [1,2,3,…,n]，其所有元素共有 n! 种排列。
 按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 给定 n 和 k，返回第 k 个排列。
 
 说明：
 
 给定 n 的范围是 [1, 9]。
 给定 k 的范围是[1,  n!]。
 
 思路
    https://blog.csdn.net/qq_17550379/article/details/84959851
 
 */

import Foundation

class GetPermutation {
    
    func getPermutation(_ n: Int, _ k: Int) -> String {
        guard n > 1 else {
            return "1"
        }
        
        // 初始化相关变量
        var vals: [Int] = Array(repeating: 1, count: n+1)
        var nums: [Int] = Array(repeating: 1, count: n+1)
        var kth = k
        for i in 1...n {
            vals[i] = vals[i-1] * i
            nums[i] = i
        }
        
        var result = ""
        kth -= 1    // 保证每次都应该取num+1
        for i in (1...n-1).reversed() {
            let num = kth / vals[i] + 1
            result.append(String(nums[num]))
            nums.remove(at: num)
            kth %= vals[i]  // 是取余
        }
        // 取剩下的最后一个数字，下标等于0是无效的
        result.append(String(nums[1]))
        return result
    }
    
    func getPermutation2(_ num: Int, _ kth: Int) -> String {
        guard num > 1 else {
            return "1"
        }
        var vals: [Int] = Array(repeating: 1, count: 11)
        var nums: [Int] = Array(repeating: 1, count: 11)
        var kth = kth - 1
        for idx in 0...10 {
            vals[idx] = idx == 0 ? 1 : vals[idx - 1] * (idx + 1)
            nums[idx] = idx + 1
        }
        
        var result = ""
        for idx in (0...num - 2).reversed() {
            let iidx = kth / vals[idx]
            result.append(String(nums[iidx]))
            nums.remove(at: iidx)
            kth %= vals[idx]
        }
        result.append(String(nums[0]))
        return result
    }
    
    func getPermutation4(_ n: Int, _ k: Int) -> String {
        var nums: [Int] = [1,2,3,4,5,6,7,8,9]
        var factorials: [Int] = [nums[0]]
        for (index, value) in nums.enumerated() {
            if index > 0 && index < n {
                factorials.append(factorials[index - 1] * value)
            }
        }
        
        var res: String = ""
        
        var tempK = k - 1
        for index in (0..<factorials.count).reversed() {
            var appendStr: String
            
            if index == 0 {
                appendStr = String(nums[index])
            }else {
                appendStr = String(nums[tempK / factorials[index - 1]])
                nums.remove(at: tempK / factorials[index - 1])
                tempK = tempK % factorials[index - 1]
            }
            res.append(appendStr)
        }
        return res
    }
}
