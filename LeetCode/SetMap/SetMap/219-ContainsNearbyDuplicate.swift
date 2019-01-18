//
//  219-ContainsNearbyDuplicate.swift
//  SetMap
//
//  Created by Csy on 2019/1/18.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class ContainsNearbyDuplicate {
    func solution1(_ nums: [Int], _ k: Int) -> Bool {
        let length = nums.count
        if length < 2 {
            return false
        }
        
        if k < 1 {
            return false
        }
        
        // set里面放的是k个不相同的数据
        var subNums = Set<Int>()
        
        for j in 0..<length {
            // 判断是否已经存在
            let  num = nums[j]
            if subNums.contains(num) {
                return true
            }
            
            subNums.insert(num)
            
            // 刚达到长度区间，需要把第一个数字移除；下次循环，就能够直接比较了
            if subNums.count == k + 1 {
                subNums.remove(nums[j - k])
            }
        }
        return false
    }
    
    func solution2(_ nums: [Int], _ k: Int) -> Bool {
        let length = nums.count
        if length < 2 {
            return false
        }
        
        if k < 1 {
            return false
        }
        
        // set里面放的是最多k+1个不相同的数据
        var subNums = Set<Int>()
        
        for j in 0..<length {
            // 保证只有k个数据，下面才能继续插入
            if j > k {
               subNums.remove(nums[j - k - 1])
            }
            
            // 尝试将新的数据插入，
            // 如果新数据插不进去，就说明有重复了
            let  num = nums[j]
            if !subNums.insert(num).inserted {
                return true
            }
        }
        return false
    }
}
