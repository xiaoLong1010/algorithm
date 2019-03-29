//
//  354-MaxEnvelopes.swift
//  Greedy
//
//  Created by Csy on 2019/3/29.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

/**
 参考最长递增子序列
 
 思路一
    1 dp[i]表示长度为i+1的子序列，最后一个数据的最小值
    2 dp[i]就是有序的，可以使用二分法查找
 思路二，会超时
    dp[i]表示以i结尾的最大信封长度.首先数组需要排序
 
 */

class MaxEnvelopes {
    
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let count = envelopes.count
        if count < 2 {
            return count
        }
        
        let sortedEnvelopes = envelopes.sorted{$0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0]}
        
        // 初始化
        var dp = sortedEnvelopes
        var dpMaxIndex = 0
        
        // 从下到上，依次计算dp
        for i in 1...(count - 1) {
            let newEnvelop = sortedEnvelopes[i]
            
            // 有更大的值，就添加到dp尾部
            if newEnvelop[0] > dp[dpMaxIndex][0] && newEnvelop[1] > dp[dpMaxIndex][1] {
                dpMaxIndex += 1
                dp[dpMaxIndex] = newEnvelop
            } else {
                // 0-dpMaxIndex,找到大于等于newEnvelop的第一个元素所在的索引
                let index = self.search(dp, maxIndex: dpMaxIndex, target: newEnvelop)
                dp[index] = newEnvelop
            }
        }
        
        return dpMaxIndex + 1
    }
    
    // 找到大于等于target的第一个元素所在的索引
    func search(_ dp: [[Int]], maxIndex: Int, target: [Int]) -> Int {
        var left = 0
        var right = maxIndex
        
        while left < right {
            let mid = left + (right-left)>>1
            let middleValue = dp[mid]
            if target == middleValue {
                return mid
            } else if target[1] <= middleValue[1] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    // 该方法超时
    func maxEnvelopes1(_ envelopes: [[Int]]) -> Int {
        let count = envelopes.count
        if count < 2 {
            return count
        }
        
        // 首先要从小到大排序
        var sortedEnvelopes = envelopes.sorted { (envelope1, envelope2) -> Bool in
            if envelope1[0] < envelope2[0] {
                return true
            } else if envelope1[0] > envelope2[0] {
                return false
            } else {        // 如果相等，就比较第二个数
                return envelope1[1] < envelope2[1]
            }
        }
        
        // 初始化
        var dp = Array(repeating: 1, count: envelopes.count)
        var maxCount = 0
        
        for i in 1..<count {
            // 第i个数据，和区间[0,i-1]的每个元素进行比较
            for j in 0...i-1 {
                if sortedEnvelopes[i][0] > sortedEnvelopes[j][0] && sortedEnvelopes[i][1] > sortedEnvelopes[j][1] {
                    dp[i] = max(dp[i], 1 + dp[j])
                }
            }
            maxCount = max(maxCount, dp[i])
        }
        
        return maxCount
    }
    
    func maxEnvelopes2(_ envelopes: [[Int]]) -> Int {
        
        var res = 0
        var dp = Array(repeating: 0, count: envelopes.count)
        
        let sortedEnvelopes = envelopes.sorted{$0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0]}
        
        for e in sortedEnvelopes {
            var low = 0
            var high = res
            
            while low < high {
                let mid = low + (high - low) / 2
                if dp[mid] < e[1] {
                    low = mid + 1
                }else {
                    high = mid
                }
            }
            
            dp[low] = e[1]
            if low == res {
                res += 1
            }
        }
        
        return res
    }
}
