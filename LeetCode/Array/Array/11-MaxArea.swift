//
//  11-MaxArea.swift
//  Array
//
//  Created by Csy on 2019/1/28.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class MaxArea {
    func solution2(_ height: [Int]) -> Int {
        let length = height.count
        var maxArea = 0
        // 左右两个下标
        var i = 0
        var j = length - 1
        
        // 两个下标不断靠近
        while i < j {
            let iHeight = height[i]
            let jHeight = height[j]
            let minHeight = min(iHeight, jHeight)
            
            maxArea = max(maxArea, (j - i) * minHeight)
            
            if iHeight > jHeight {
                j -= 1
            } else {
                i += 1
            }
        }
        
        return maxArea
    }
    
    func solution1(_ height: [Int]) -> Int {
        let length = height.count
        var maxArea = 0
        
        for i in 0...length-2 {
            for j in i+1...length-1 {
                let distance = j - i
                let minHeight = min(height[i], height[j])
                
                maxArea = max(maxArea, distance * minHeight)
            }
        }
        return maxArea
    }
}
