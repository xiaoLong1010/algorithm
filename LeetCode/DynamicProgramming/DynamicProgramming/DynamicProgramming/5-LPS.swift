//
//  5-LPS.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/1/2.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

/**
 字符串中的最长回文子字符串
 https://www.jianshu.com/p/c82cada7e5b0
 状态dp[i][j]表示索引i到索引j的子串是否是回文串
 dp[i][j] = true, 如果i=j
 dp[i][j] = (str[i]==str[j]), 如果j-i=1,
 dp[i][j] = (str[i]=str[j])&&dp[i+1][j-1], 如果j-i>1,
 */
class LongestPalindromicSubstring {
    func longestPalindrome(_ str: String) -> String {
        let length = str.count
        if length <= 1 {
            return str
        }
        let firstIndex = str.startIndex
        var startIndex = str.startIndex
        var maxLength = 1
        
        for i in 1...length-1 {
            // 奇数扩展
            if i - maxLength - 1 >= 0 {
                let index1 = str.index(firstIndex, offsetBy: i-maxLength-1)
                let index2 = str.index(firstIndex, offsetBy: i)
                let subStr = str[index1...index2]
                
                if String(subStr) == String(subStr.reversed()) {
                    startIndex = index1
                    maxLength += 2
                    continue
                }
            }
            
            // 偶数扩展
            if i - maxLength >= 0 {
                let index1 = str.index(firstIndex, offsetBy: i-maxLength)
                let index2 = str.index(firstIndex, offsetBy: i)
                let subStr = str[index1...index2]
                if String(subStr) == String(subStr.reversed()) {
                    startIndex = index1
                    maxLength += 1
                }
            }
        }
        
        let result = str[startIndex..<str.index(startIndex, offsetBy: maxLength)]
        return String(result)
    }
    
    // 时间超时
    func solution1(_ str: String) -> String {
        let length = str.count
        if length <= 1 {
            return str
        }
        
        
        var startIndex = str.startIndex
        var maxLength = 1
        
        let oneRow = Array(repeating: false, count: length)
        var dp = Array(repeating: oneRow, count: length)
        
        // 先遍历j，再遍历i，保证dp[i + 1][j - 1])有正确的值
        for j in 0...(length - 1) {
            for i in 0...j {
                
                let iIndex = str.index(str.startIndex, offsetBy: i)
                let iValue = str[iIndex]
                let jIndex = str.index(str.startIndex, offsetBy: j)
                let jValue = str[jIndex]
                
                // 三种情况下的取值
                if j - i > 1 {
                    dp[i][j] = ((iValue == jValue) && dp[i + 1][j - 1])
                } else if j - i == 1 {
                    dp[i][j] = (iValue == jValue)
                } else {
                    dp[i][j] = true
                }
                
                // 更新最大值
                let currentLength = j - i + 1
                if dp[i][j] && currentLength > maxLength {
                    startIndex = iIndex
                    maxLength = currentLength
                }
            }
        }
        
        return String(str[startIndex..<str.index(startIndex, offsetBy: maxLength)])
    }
}
