//
//  56-IntervalMerge.swift
//  Array
//
//  Created by Csy on 2019/3/28.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给出一个区间的集合，请合并所有重叠的区间。
 
 输入: [[1,3],[2,6],[8,10],[15,18]]
 输出: [[1,6],[8,10],[15,18]]
 解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 
 */


public class Interval {
    public var start: Int
    public var end: Int
    
    public init(_ start: Int, _ end: Int) {
      self.start = start
      self.end = end
    }
}

import Foundation

class IntervalMerge {
    func merge(_ intervals: [Interval]) -> [Interval] {
        if intervals.count < 2 {
            return intervals
        }
        
        // 首先排序
        var sortedIntervals = intervals.sorted {
            return $0.start < $1.start
        }
        
        // 只操作sortedIntervals，可以减少空间复杂度
        var i = 0
        var j = 1
        while true {
            // 区间j在区间i内，则移除区间j
            while j < sortedIntervals.count && sortedIntervals[j].end <= sortedIntervals[i].end {
                sortedIntervals.remove(at: j)
            }
            if j >= sortedIntervals.count {
                break
            }
            
            // 区间1和区间j重合，将j合并到i
            if sortedIntervals[j].start <= sortedIntervals[i].end {
                sortedIntervals[i].end = sortedIntervals[j].end
                sortedIntervals.remove(at: j)
            }
            else {      // 区间1和区间j是独立的
                i += 1
                j += 1
            }
            if j >= sortedIntervals.count {
                break
            }
        }
        
        return sortedIntervals
    }
    
    func merge2(_ intervals: [Interval]) -> [Interval] {
        if intervals.count < 2 {
            return intervals
        }
        
        // 首先排序
        var sortedIntervals = intervals.sorted {
            return $0.start < $1.start
        }
        
        var preInterval = sortedIntervals[0]
        var i = 1
        while i < sortedIntervals.count {
            // 两个区间有重合，就找最大的end
            if preInterval.end >= sortedIntervals[i].start {
                preInterval.end = max(preInterval.end, sortedIntervals[i].end)
                sortedIntervals.remove(at: i)
            }
            else {      // 两个区间是独立的
                preInterval = sortedIntervals[i]
                i += 1
            }
        }
        
        return sortedIntervals
        
//        空间复杂度略高
//        var preInterval = sortedIntervals[0]
//        var results = [Interval]()
//        for i in 1..<sortedIntervals.count {
//            // 两个区间有重合，就找最大的end
//            if preInterval.end >= sortedIntervals[i].start {
//                preInterval.end = max(preInterval.end, sortedIntervals[i].end)
//            }
//            else {      // 两个区间是独立的
//                results.append(preInterval)
//                preInterval = sortedIntervals[i]
//            }
//        }
//        results.append(preInterval)
//        return results
    }
}


