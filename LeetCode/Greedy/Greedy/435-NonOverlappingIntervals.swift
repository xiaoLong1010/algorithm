//
//  435-NonOverlappingIntervals.swift
//  Greedy
//
//  Created by Csy on 2019/1/3.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个区间的集合，找到需要移除区间的最小数量，使剩余区间互不重叠。
 
 注意:
 可以认为区间的终点总是大于它的起点。
 区间 [1,2] 和 [2,3] 的边界相互“接触”，但没有相互重叠。
 
 思路：相当于求最长递增子序列

 */

import Foundation

public class Interval {
    public var start: Int
    public var end: Int
    
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}


class NonOverlappingIntervals {
    
    func eraseOverlapIntervals(_ intervals: [Interval]) -> Int {
        let count = intervals.count
        if count < 2 {
            return 0
        }
        
        // end从小到大排列
        let sortedIntervals = intervals.sorted { (interval1, interval2) -> Bool in
            if interval1.end != interval2.end {
                return interval1.end < interval2.end
            }
            return interval1.start < interval2.start
        }
        
        // 初始值
        var subCount = 1
        var pre = 0
        
        for i in 1...(count - 1) {
            // 当前的start大于之前的end
            if sortedIntervals[i].start >= sortedIntervals[pre].end {
                subCount += 1
                pre = i
            }
        }
        return count - subCount
    }
}
