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
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let length = s.count
        if t.count != length {
            return false
        }
        
        // 转换成字符数组
        let sChars = Array(s)
        let tChars = Array(t)
        
        // 记录字符的个数
        var counter1 = Dictionary<Character, Int>()
        var counter2 = Dictionary<Character, Int>()
        for i in 0..<length {
            let c1 = sChars[i]
            let c2 = tChars[i]
            
            self.addChar(&counter1, c1)
            self.addChar(&counter2, c2)
        }
        
        return counter1 == counter2
    }
    
    func addChar(_ info: inout Dictionary<Character, Int>, _ c: Character) -> Void {
        if let count = info[c] {
            info[c] = count + 1
        }
        else {
            info[c] = 1
        }
    }
    
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
