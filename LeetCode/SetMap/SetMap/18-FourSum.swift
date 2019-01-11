//
//  18-FourSum.swift
//  SetMap
//
//  Created by Csy on 2019/1/11.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class FourSum {
    func solution1(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        
        return self.kSumCore(nums, target: target, k: 4, startIndex: 0)
    }
    
    func kSumCore(_ nums: [Int], target: Int, k: Int, startIndex: Int) -> [[Int]] {
        guard k > 1 else {
            return []
        }
        
        // nums的长度必须大于k
        let length = nums.count
        guard length >= k else {
            return []
        }
        
        var result = [[Int]]()
        
        // 两个数求和，使用左右两个索引下标，不断地缩小两个下标的距离
        if  k == 2 {
            var i = startIndex
            var j = length - 1
            
            while i < j {
                let oneNum = nums[i]
                let twoNum = nums[j]
                let sum = oneNum + twoNum
                
                if sum == target {
                    result.append([oneNum, twoNum])
                    
                    // 缩小两个下标的距离
                    i += 1
                    j -= 1
                    
                    // 防止数据重复
                    while i < j && nums[i] == nums[i-1] {
                        i += 1
                    }
                    while i < j && nums[j] == nums[j+1] {
                        j -= 1
                    }
                } else if sum > target {
                    j -= 1
                } else {
                    i += 1
                }
            }
            return result
        }
        
        // 递归，三个或者三个以上数字求和
        var index = startIndex
        
        while index <=  length-k {
            let num = nums[index]
            let tempResult = self.kSumCore(nums, target: target-num, k: k-1, startIndex: index+1)
            
            // 当前的num，插入结果中的第一位
            for aTempSumList in tempResult {
                var sumList = aTempSumList
                sumList.insert(num, at: 0)
                
                result.append(sumList)
            }
            
            // 防止数据重复
            index += 1
            while index <= length-k && nums[index] == nums[index-1] {
                index += 1
            }
        }
        
        return result
    }
}
