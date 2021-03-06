//
//  3-LongestSubstring.swift
//  Array
//
//  Created by Csy on 2019/1/7.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

/**
 3. 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 */
class LongestSubstring {
    func solution1(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        // 字符串变成数组，便于计算length
        let chars = Array(s)
        let length = chars.count
        
        // 窗口的左右索引，初始值
        var left = 0
        var right = 0
        
        // 子字符串已经包含的字符
        var used = Dictionary<Character, Int>()
        used[chars[left]] = left
        var result = 1      // 初始取最小值
        
        while (right+1) < length {
            // 右索引，扩大窗口
            right += 1
            let char = chars[right]
            
            // 新增加的字符串，之前字符串已经包含了，左索引需要向右移动，减少窗口
            if let sameIndex = used[char] {
                // 把 left...sameIndex之间的字符删掉
                for removeIndex in left...sameIndex {
                    used.removeValue(forKey: chars[removeIndex])
                }
                left = sameIndex + 1
                used[char] = right
            } else {
                used[char] = right
            }
            
            result = max(result, right-left+1)
        }
        
        return result
    }
    
    func solution2(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        // 字符串变成数组，便于计算length
        let chars = Array(s)
        let length = chars.count
        
        // 窗口的左右索引，初始值
        var left = 0
        var right = 0
        
        // 子字符串已经包含的字符
        var used = Dictionary<Character, Int>()
        used[chars[left]] = left
        var result = 1      // 初始取最小值
        
        while (right+1) < length {
            // 如果向右新增加的字符串，已经被包含了，
            // 则左索引需要向右移动，减少窗口。需要先把左索引对应的字符删掉
            let addChar = chars[right+1]
            if used[addChar] != nil {
                // 由于没有right+1，会不断把left向右移
                used.removeValue(forKey: chars[left])
                if left < right {
                    left += 1
                } else {
                    left += 1
                    right += 1
                    used[addChar] = right
                }
            } else {
                right += 1
                used[addChar] = right
            }
            
            result = max(result, right-left+1)
        }
        
        return result
    }
    // 在leetcode上最快的解法
    func solution4(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        // 字符串变成数组，便于计算length
        let chars = Array(s)
        let length = chars.count
        
        // 窗口的左右索引，初始值
        var left = 0
        var right = 0
        // 结果初始取
        var result = 1
        
        while (right+1) < length {
            // 即将加入的char
            let toAddIndex = right + 1
            let toAddChar = chars[toAddIndex]
            
            // 查看加入的char，在已有的left...right区间，是否重复
            // 如果重复，left 就取重复之后的第一个元素
            for index in left...right {
                if chars[index] == toAddChar {
                    left = index + 1
                    break
                }
            }
            
            // 右边扩大区间
            right += 1
            result = max(result, right-left+1)
        }
        
        return result
    }
    
    func solution3(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        var left = 0
        var right = 0
        var result = right - left + 1
        
        let chars = Array(s)
        
        while right < chars.count
        {
            // [left,right)区间，是否有和chars[right]相同的字符
            // 如果有的话，left = i + 1
            var i = left
            while i < right
            {
                if chars[i] == chars[right]
                {
                    left = i + 1
                    break;
                }
                i += 1
            }
            result = max(result, right - left + 1)
            right += 1
        }

        return result
    }
    
    // 动态规划
    // dp[i]表示以下标为i的字符结尾不包含重复字符的最长子字符串长度,子字符串是包含最后一个字符的
    //
    func solution5(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        // 字符串变成数组，便于计算length
        let chars = Array(s)
        let length = chars.count
        var result = 1
        
        var dp = Array(repeating: 1, count: length)
        
        for dpIndex in 1..<length {
            // dpIndex相当于以preMaxIndex结尾的子字符串长度
            // [preMinIndex, preMaxIndex]就相当于以preMaxIndex结尾的最长不重复子字符串
            let preMaxIndex = dpIndex - 1
            let preMinIndex  = dpIndex - dp[preMaxIndex]
            
            // 倒序从[preMinIndex, preMaxIndex]查找，看是否有和dpIndex相同的字符
            var i = preMaxIndex
            while i >= preMinIndex {
                if chars[dpIndex] == chars[i] {
                    break
                }
                i -= 1
            }
            
            dp[dpIndex] = dpIndex - i
            
            if dp[dpIndex] > result {
                result = dp[dpIndex]
            }
        }
        return result
    }
}
