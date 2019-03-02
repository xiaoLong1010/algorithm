//
//  149-MaxPoints.swift
//  SetMap
//
//  Created by Csy on 2019/2/3.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二维平面，平面上有 n 个点，求最多有多少个点在同一条直线上。
 */

import Foundation

class Point {
    public var x: Int
    public var y: Int
    
    public init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

class MaxPoints {
    func solution1(_ points: [Point]) -> Int {
        let length = points.count
        var maxCount = 0
        
        for i in 0..<length {
            var map = [String: Int]()
            var sameCount = 0
            var tempMax = 0
            
            // 穿过i的所有直线，求一个最大的
            for j in i+1..<length {
                var x = points[j].x - points[i].x
                var y = points[j].y - points[i].y
                
                // 同一个点
                if x == 0 && y == 0 {
                    sameCount += 1
                    continue
                }
                
                // 最大公约数
                let divisor = self.maxDivisor(x, y)
                if divisor != 0 {
                    x /= divisor
                    y /= divisor
                }
                
                // 穿过坐标i，并且斜率都是k
                let k = "\(y)#\(x)"
                map[k, default: 0] += 1
                
                // 求穿过坐标i的最大数
                tempMax = max(tempMax, map[k]!)
            }
            // 1是坐标i本身
            maxCount = max(maxCount, tempMax+sameCount+1)
        }
        
        return maxCount
    }
    
    // a和b的最大公约数
    func maxDivisor(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return maxDivisor(b, a % b)
    }
}

