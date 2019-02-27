//
//  128-LongestConsecutive.swift
//  Array
//
//  Created by Csy on 2019/2/27.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个未排序的整数数组，找出最长连续序列的长度。
 
 要求算法的时间复杂度为 O(n)。
 
 输入: [100, 4, 200, 1, 3, 2]
 输出: 4
 解释: 最长连续序列是 [1, 2, 3, 4]。它的长度为 4。
 */
import Foundation

class LongestConsecutive {
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        // 去除重复的元素
        let uniqueNums = Set(nums)
        
        var maxLength = 1
        for num in uniqueNums {
            // 不存在num-1，就从num开始计算最长连续序列
            if !uniqueNums.contains(num-1) {
                // 区间是[num,endNum)
                var endNum = num + 1
                while uniqueNums.contains(endNum) {
                    endNum += 1
                }
                
                maxLength = max(maxLength, endNum-num)
            }
        }
        
        return maxLength
    }
    
    func longestConsecutive2(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        // 去除重复的元素，并且进行排序
        let newNums = Array(Set(nums)).sorted()
        
        let count = newNums.count
        var i = 1
        var maxLength = 1
        while i < count {
            var tempLength = 1
            // 如果连续递增，长度就加1
            while i < count && ((newNums[i-1]+1) == newNums[i]) {
                tempLength += 1
                i += 1
            }
            
            maxLength = max(maxLength, tempLength)
            i += 1
        }
        
        return maxLength
    }
}
