//
//  120-MinimumTotal.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/17.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上
 
 dp[i]表示每一行的路径的最小值，如果从上到下计算，将最后一行的结果算出来之后，还需要再遍历一遍，再找出最小值
 
 其实也可以使用dp[i][j]，但是只用到了三角形的空间，其余的浪费了，但是比较好理解
 思路一
    1 采用从下到上，先计算最后一行，其实就是初始值
    2 取下面两行的最小值
    3 加上面一行的一个值，再替换这个值
    4 不断地从下到上计算。最后面一行只有一个值，那就是结果
    5 也可以从上到下的计算，但最后一行的结果算出来之后，还需要再遍历一遍，再找出最小值
 
 */

import Foundation

class MinimumTotal {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 && triangle[0].count > 0 else {
            return 0
        }
        let rowConunt = triangle.count
        
        // 如果是从下到上的话，最后一行就是初始值
        var dp = triangle[rowConunt - 1]
        
        // 下面一行相邻的两个值，取最小值
        // 加上上面一行的值，形成上面一行的值
        var i = dp.count - 2    // 计算倒数第二行
        while  i >= 0 {
            for j in 0...i {    // 遍历这一行，取相邻两个数的较小值
                dp[j] = min(dp[j], dp[j + 1]) + triangle[i][j]
            }
            i -= 1
        }
        
        return dp[0]
    }
    
    func minimumTotal2(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 && triangle[0].count > 0 else {
            return 0
        }
        let m = triangle.count, n = triangle[0].count
        var dp = triangle[m - 1]
        
        var j = m - 2
        while j >= 0 {
            let arr = triangle[j]
            for i in 0..<arr.count {
                dp[i] = min(dp[i], dp[i + 1]) + arr[i]
            }
            
            j -= 1
        }
        
        return dp[0]
    }
}
