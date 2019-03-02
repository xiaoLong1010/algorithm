//
//  447-NumOfBoomerangs.swift
//  SetMap
//
//  Created by Csy on 2019/1/13.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定平面上 n 对不同的点，“回旋镖” 是由点表示的元组 (i, j, k) ，其中 i 和 j 之间的距离和 i 和 k 之间的距离相等（需要考虑元组的顺序）。
 找到所有回旋镖的数量。你可以假设 n 最大为 500，所有点的坐标在闭区间 [-10000, 10000] 中。
 
 输入:
 [[0,0],[1,0],[2,0]]
 
 输出:
 2
 
 解释:
 两个回旋镖为 [[1,0],[0,0],[2,0]] 和 [[1,0],[2,0],[0,0]]
 
 思路
    1 对于每个点i，求出跟它距离相同的所有点，key是距离，value是点的个数
 
 */

import Foundation

class NumOfBoomerangs {
    func solution1(_ points: [[Int]]) -> Int  {
        let length = points.count
        guard length > 0 else {
            return 0
        }
        var count = 0
        
        for i in 0..<length {
            var distanceInfo = Dictionary<Int,Int>()
            
            // 找出与i距离相同的点
            for j in 0..<length {
                if i != j {
                    let distance = self.distance(points[i], points[j])
                    if let tempCount = distanceInfo[distance] {
                        distanceInfo[distance] = tempCount + 1
                    } else {
                        distanceInfo[distance] = 1
                    }
                }
            }
            
            // 遍历字典，同i的距离相同的点大于2个
            for (_, countOfDistance) in distanceInfo {
                count += (countOfDistance * (countOfDistance - 1))
            }
            
        }
        
        return count
    }
    
    func distance(_ point1: [Int], _ point2: [Int]) -> Int {
        let x = point1[0] - point2[0]
        let y = point1[1] - point2[1]
        
        return x * x + y * y
    }
}
