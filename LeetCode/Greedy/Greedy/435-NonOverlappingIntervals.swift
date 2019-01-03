//
//  435-NonOverlappingIntervals.swift
//  Greedy
//
//  Created by Csy on 2019/1/3.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation


class NonOverlappingIntervals {
    /**
     在每次选择中，区间的结尾最为重要，选择的区间结尾越小，留给后面的区间的空间越大，那么后面能够选择的区间个数也就越大
     */
    func solution1(_ intervals: Array<Array<Int>>) -> Int {
        let intervals = intervals.sorted { (interval1, interval2) -> Bool in
            let start1 = interval1[0]
            let end1 = interval1[1]
            let start2 = interval2[0]
            let end2 = interval2[1]
            
            // end从小到大排列
            if end1 != end2 {
                return end1 < end2
            }
            return start1 < start2
        }
        let length = intervals.count
        
        
        // 初始值
        var res = 1
        var pre = 0
        
        for index in 1...(length - 1) {
            let start = intervals[index][0]
            
            // 当前的start如果不小于之前的end，则数量加1
            if start >= intervals[pre][1] {
                res = res + 1
                pre = index
            }
        }
        
        return length - res
    }
}
