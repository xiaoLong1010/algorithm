//
//  242-IsAnagram.swift
//  SetMap
//
//  Created by Csy on 2019/1/29.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。
 
 输入: s = "anagram", t = "nagaram"
 输出: true
 
 输入: s = "rat", t = "car"
 输出: false
 */

import Foundation

class IsAnagram {
    func solution1(_ s: String, _ t: String) -> Bool {
        // 转换成字符数组
        let sChars = Array(s)
        let tChars = Array(t)
        
        // 记录字符的个数
        var counter = Dictionary<Character, Int>()
        for char in sChars {
            if let count = counter[char] {
                counter[char] = count + 1
            }
            else {
                counter[char] = 1
            }
        }
        
        // 遍历字符串t，将counter的字符删除，如果最后conter的元素为0，返回true
        for char in tChars {
            if var count = counter[char] {
                // 找到相同字符，首先count要减1
                count -= 1
                
                // count等于0，就要把这个字符删除
                if count == 0 {
                    counter.removeValue(forKey: char)
                }
                else {
                    counter[char] = count
                }
            }
            else {
                return false
            }
        }
        
        return counter.count == 0
    }
}
