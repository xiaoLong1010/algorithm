//
//  674-FindLengthOfLCIS.swift
//  Array
//
//  Created by Csy on 2019/2/27.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个未经排序的整数数组，找到最长且连续的的递增序列。
 
 输入: [1,3,5,4,7]
 输出: 3
 解释: 最长连续递增序列是 [1,3,5], 长度为3。
 尽管 [1,3,5,7] 也是升序的子序列, 但它不是连续的，因为5和7在原数组里被4隔开。
 
 */

import Foundation

class FindLengthOfLCIS {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        let count = nums.count
        if  count < 2 {
            return count
        }
        var currentLength = 1
        var maxlength =  1
        
        for i in 1..<count {
            if nums[i-1] < nums[i] {
                currentLength += 1
            } else {
                maxlength = max(maxlength, currentLength)
                currentLength = 1
            }
        }
        
        return max(maxlength, currentLength)
    }
}
