//
//  139-WordBreak.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/20.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个非空字符串 s 和一个包含非空单词列表的字典 wordDict，判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。
 说明：
 拆分时可以重复使用字典中的单词。
 你可以假设字典中没有重复的单词。
 输入: s = "leetcode", wordDict = ["leet", "code"]
 输出: true
 解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"
 
 输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 输出: false
 
 dp[i]表示前i个字符组成的字符串是否可以拆分
 dp[i] = dp{0...j} && [j+1,i]是否在字符串数组中
 */

import Foundation

class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if wordDict.count == 0 {
            return false
        }
        let words = Set(wordDict)
        
        let length = s.count
        var dp = Array(repeating: false, count: length+1)
        dp[0] = true
        
        for i in 1...length {
            for j in 0..<i {
                let startIndex = s.index(s.startIndex, offsetBy: j)
                let endIndex = s.index(s.startIndex, offsetBy: i)
                let subStr = s[startIndex..<endIndex]
                
                if dp[j] && words.contains(String(subStr)) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[length]
    }
}
