//
//  347-TopKFrequentNums.swift
//  StackQueue
//
//  Created by Csy on 2019/1/5.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

private struct FrequentNum {
    let frequent: Int
    let num: Int
}

private func < (f1: FrequentNum, f2: FrequentNum) -> Bool {
    return f1.frequent < f2.frequent
}
class TopKFrequentNums {
    func solution1(_ nums: Array<Int>, _ K: Int) -> Array<Int>? {
        
        // 遍历数组，求出[num : frequent]的字典
        var numFrequentInfo = Dictionary<Int, Int>()
        for num in nums {
            if let frequent = numFrequentInfo[num] {
                numFrequentInfo[num] = frequent + 1
            } else {
                numFrequentInfo[num] = 1
            }
        }

        var queue = PriorityQueue<FrequentNum>(sort: <)
        
        for (num, frequent) in numFrequentInfo {
            // 队列的容量大于K，
            // 当前的frequent大于队列中最小的frequent（即第一个元素）
            // 那就需要替换
            if queue.count >= K {
                if frequent > queue.peek()!.frequent {
                    _ = queue.dequeue()
                    queue.enqueue(FrequentNum(frequent: frequent, num: num))
                }
            } else {
                queue.enqueue(FrequentNum(frequent: frequent, num: num))
            }
        }
        
        // 将优先队列的数据放到数组中
        var topKNums = Array<Int>()
        while queue.count > 0 {
            topKNums.append(queue.dequeue()!.num)
        }
        return topKNums
    }
}
