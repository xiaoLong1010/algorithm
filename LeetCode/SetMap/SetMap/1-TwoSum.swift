//
//  1-TwoSum.swift
//  SetMap
//
//  Created by Csy on 2019/1/9.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation
/**
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
class TwoSum {
    func solution1(_ nums: [Int], _ target: Int) -> [Int] {
        let length = nums.count
        guard length > 1 else {
            return []
        }
        
        // num[i]和num[i]前面的数字，看是否能够找到target
        var info = Dictionary<Int, Int>()
        for index in 0..<length {
            let aNum = nums[index]
            let anotherNum = target - aNum
            if let anotherIndex = info[anotherNum] {
                return [anotherIndex,index]
            }
            
            // 没有找到target，放进map
            info[aNum] = index
        }
        
        return []
    }
}
