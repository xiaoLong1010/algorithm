//
//  91-NumDecodings.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/17.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 一条包含字母 A-Z 的消息通过以下方式进行了编码
 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 
 给定一个只包含数字的非空字符串，请计算解码方法的总数。
 
 输入: "12"
 输出: 2
 解释: 它可以解码为 "AB"（1 2）或者 "L"（12）
 
 输入: "226"
 输出: 3
 解释: 它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6)
 
 需要注意的是
    1 以0开头的话，那结果都是0，比如00111，01
 
 dp[i]表示长度i的字符串解码方法总数,初始全部为0
 dp[i] = dp[i-1]+dp[i-2]
 
 如果v[i]>0,dp[i] += dp[i-1]
 如果v[i-1...i]可以解码， dp[i] += dp[i-2],

 */

import Foundation

class NumDecodings {
    func numDecodings(_ s: String) -> Int {
        let numCount = s.count
        guard numCount > 0 else {
            return 0
        }
        
        // 转换成整型数组
        let digits = Array(s).map { Int(String($0))! }
        
        // 初始化dp
        var dp = Array(repeating: 0, count: numCount)
        dp[0] = digits[0] == 0 ? 0 : 1
        
        // 根据状态方程计算
        var i = 1
        while i < numCount {
            if digits[i] > 0 {
                dp[i] += dp[i-1]
            }
            
            let num = digits[i - 1] * 10 + digits[i]
            if num >= 10 && num <= 26 {
                if i > 1 {
                    dp[i] += dp[i - 2]
                } else {
                    dp[i] += 1
                }
            }

            i += 1
        }
        
        return dp[numCount-1]
    }
    
    func numDecodings2(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        let digits = Array(s).map { Int(String($0))! }
        var dp = Array(repeating: 0, count: digits.count + 1)
        dp[0] = 1
        dp[1] = digits[0] == 0 ? 0 : 1
        for i in stride(from: 2, through: digits.count, by: 1) {
            dp[i] += (digits[i - 1] > 0 ? dp[i - 1] : 0)
            let num = digits[i - 2] * 10 + digits[i - 1]
            dp[i] += ((num >= 10 && num <= 26) ? dp[i - 2] : 0)
        }
        
        return dp[digits.count]
    }
}
