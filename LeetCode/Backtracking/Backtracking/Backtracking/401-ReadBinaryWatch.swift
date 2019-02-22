//
//  401-ReadBinaryWatch.swift
//  Backtracking
//
//  Created by Csy on 2019/2/22.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 例如，上面的二进制手表读取 “3:25”。
 给定一个非负整数 n 代表当前 LED 亮着的数量，返回所有可能的时间。
 输出的顺序没有要求。
 小时不会以零开头，比如 “01:00” 是不允许的，应为 “1:00”。
 分钟必须由两位数组成，可能会以零开头，比如 “10:2” 是无效的，应为 “10:02”。
 
 案例:
 输入: n = 1
 返回: ["1:00", "2:00", "4:00", "8:00", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32"]
 
 思路
    - 从1-10区间取数字，1-4表示时针，5-10表示分针，取到了表示灯亮，代表二进制1
    - 求出所有的组合，时针最多取3个灯亮，分针最多取5个，就是说最多取8个
    - 根据生成的组合，排除不符合规则的
 */

import Foundation

class ReadBinaryWatch {
    var results = [String]()
    var map = [
        1 : 1,
        2 : 2,
        3 : 4,
        4 : 8,
        5 : 1,
        6 : 2,
        7 : 4,
        8 : 8,
        9 : 16,
        10 : 32
    ]
    
    func readBinaryWatch(_ num: Int) -> [String] {
        
        var subNums = [Int]()
        
        self.combination(num: 10, k: num, 1, &subNums)
        
        return self.results
    }
    
    /// - Parameters:
    ///   - num: 1-num的区间，所有的可选数字
    ///   - k: 可以选多少个数字
    ///   - start: 区间的起点
    ///   - subCombina: 之前选好的数字
    func combination(num: Int,k: Int, _ start: Int, _ subCombina: inout Array<Int>) -> Void {
        if subCombina.count == k {
            let aResult = self.parseCombination(subCombina)
            if aResult.count > 0 {
                self.results.append(aResult)
            }
            return
        }
        
        if start > num {
            return
        }
        
        // 下一次从index+1开始，之前都不能要
        // 还有k - subCombina.count()个空位, 所以, [i...n] 中至少要有这么多个元素
        // maxIndex最大值 n - left + 1
        let left = k - subCombina.count     // 剩下需要选的数字
        let maxIndex = num - left + 1
        for index in start...maxIndex {
            subCombina.append(index)
            combination(num: num, k: k, index+1, &subCombina)
            subCombina.removeLast()
        }
    }
    
    func parseCombination(_ nums: [Int]) -> String {
        var hour = 0
        var minute = 0
        for num in nums {
            if num > 0 && num < 5 {
                hour += (self.map[num])!
            } else {
                minute += (self.map[num])!
            }
        }
        if hour > 11 {
            return ""
        }
        if minute > 59 {
            return ""
        }
        
        var result = "\(hour):"
        if minute >= 10 {
            result = result.appending(String(minute))
        } else {
            result = "\(result)0\(minute)"
        }
        return result
    }
}
