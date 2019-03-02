//
//  125-IsPalindrome.swift
//  Array
//
//  Created by Csy on 2019/1/27.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 
 说明：本题中，我们将空字符串定义为有效的回文串。
 
 输入: "A man, a plan, a canal: Panama"
 输出: true
 */

import Foundation

class IsPalindrome {
    func solution1(_ s: String) -> Bool {
        let length = s.count
        if length == 0 {
            return true
        }
        
        // 字符串转换成字符数组
        let chars = Array(s.lowercased())
        
        // 左右两个索引
        var i = 0
        var j = length - 1
        
        while true {
            // 左边找到不为空的字符
            while i < j && self.isInValidChar(chars[i]) {
                i += 1
            }
            
            // 右边找到不为空的字符
            while i < j && self.isInValidChar(chars[j]) {
                j -= 1
            }
            
            // 整个字符串已经遍历完
            if i >= j {
                return true
            }
            
            // 比较两个字符是否相等
            if chars[i] == chars[j] {
                i += 1
                j -= 1
            } else {
                return false
            }
        }
    }
    
    func isInValidChar(_ char: Character) -> Bool {
        return !(char >= "a" && char <= "z") &&
               !(char >= "0" && char <= "9")
    }
}
