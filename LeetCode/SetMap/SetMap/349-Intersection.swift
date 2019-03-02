//
//  349-Intersection.swift
//  SetMap
//
//  Created by Csy on 2019/1/28.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class Intersection {
    func solution1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // nums1装到set中.在leetcode中，遍历数组加入到数组，竟然比构造的形式快
        var set = Set(nums1)
        
        // 相同的元素数组
        var commons = Array<Int>()
        
        // 找到相同元素之后，加入到数组之后，要从set中删除，防止重复加入到数组
        for num in nums2 {
            if set.contains(num) {
                commons.append(num)
                set.remove(num)
            }
        }
        
        return commons
    }
}
