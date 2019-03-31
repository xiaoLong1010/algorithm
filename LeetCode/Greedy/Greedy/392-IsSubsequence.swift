//
//  392-IsSubsequence.swift
//  Greedy
//
//  Created by Csy on 2019/3/31.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定字符串 s 和 t ，判断 s 是否为 t 的子序列。
 
 你可以认为 s 和 t 中仅包含英文小写字母。字符串 t 可能会很长（长度 ~= 500,000），而 s 是个短字符串（长度 <=100）。
 
 字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。
 
 示例 1:
 s = "abc", t = "ahbgdc"
 
 返回 true.
 
 示例 2:
 s = "axc", t = "ahbgdc"
 
 返回 false.
 */

import Foundation

class IsSubsequence {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sLength = s.count
        let tLength = t.count
        if sLength == 0 {
            return true
        }
        if tLength == 0 {
            return false
        }
        
        // 字符串转换成数组
        let sChars = Array(s)
        let tChars = Array(t)
        
        // 找到相同的就一起递增
        var i = 0
        var j = 0
        while i < sLength && j < tLength{
            if sChars[i] == tChars[j] {
                i += 1
                j += 1
            }
            else {
                j += 1
            }
        }
        
        return (i == sLength)
    }
}
