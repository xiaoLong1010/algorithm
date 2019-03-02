//
//  350-Intersection2.swift
//  SetMap
//
//  Created by Csy on 2019/1/28.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定两个数组，编写一个函数来计算它们的交集。
 输入: nums1 = [1,2,2,1], nums2 = [2,2]
 输出: [2,2]
 
 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
 我们可以不考虑输出结果的顺序。
 */

import Foundation

class Intersection2 {
    func solution1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // nums1装到dict
        // 第一个int表示数字，第二个表示出现的次数
        var numsInfo = Dictionary<Int,Int>()
        for num in nums1 {
            if let count = numsInfo[num] {
                numsInfo[num] = count + 1
            } else {
                numsInfo[num] = 1
            }
        }
        
        // 相同的元素数组
        var commons = Array<Int>()
        
        // 找到相同元素之后，加入到数组之后。
        // 如果当前出现的次数等于1,则要从dict中删除
        for num in nums2 {
            if var count = numsInfo[num] {
                commons.append(num)
                
                count -= 1
                if count == 0 {
                    numsInfo.removeValue(forKey: num)
                } else {
                    numsInfo[num] = count
                }
            }
        }
        
        return commons
    }
}
