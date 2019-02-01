//
//  451-FrequencySort.swift
//  SetMap
//
//  Created by Csy on 2019/1/31.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 451
 给定一个字符串，请将字符串里的字符按照出现的频率降序排列。
 
 输入:
 "tree"
 
 输出:
 "eert"
 
 解释:
 'e'出现两次，'r'和't'都只出现一次。
 因此'e'必须出现在'r'和't'之前。此外，"eetr"也是一个有效的答案。
 */

import Foundation

class FrequencySort {
    func solution2(_ s: String) -> String {
        let sChars = Array(s)
        
        // 每个字符对应的个数
        var charCountInfo = Dictionary<Character, Int>()
        for char in sChars {
            if let count = charCountInfo[char] {
                charCountInfo[char] = count + 1
            } else {
                charCountInfo[char] = 1
            }
        }
        
        // 将charCountInfo按照value，即字符个数，从大到小排序
        let sortedInfo = charCountInfo.sorted { $0.1 > $1.1 }
        
//        let sortedInfo = charCountInfo.sorted { (kv1, kv2) -> Bool in
//            let (_, count1) = kv1
//            let (_, count2) = kv2
//
//            return count1 > count2
//        }
        
        // 构造新的字符串
        var newStr = ""
        for kv in sortedInfo {
            newStr += String(repeating: kv.key, count: kv.value)
        }
        return newStr
    }

    
    func solution1(_ s: String) -> String {
        var sChars = Array(s)
        let length = sChars.count
        
        // 存放字符的个数
        var charCountInfo = Dictionary<Character, Int>()
        // 索引是字符出现的个数，值是对应的字符
        var counter = Array<Set<Character>>()
        
        for i in 0..<length {
            let char = sChars[i]
            
            if let charCount = charCountInfo[char] {
                charCountInfo[char] = charCount+1
                
                // 将当前char从set删除
                var charSet = counter[charCount-1]
                charSet.remove(char)
                counter[charCount-1] = charSet
                
                // 如果counter已经有charCount+1的长度
                if counter.count >= charCount+1 {
                    counter[charCount].insert(char)
                }
                else {
                    var set = Set<Character>()
                    set.insert(char)
                    counter.append(set)
                }
            }
            // 字符第一次出现
            else {
                charCountInfo[char] = 1
                // 原先已经有出现过一次的字符，就把现在这个字符添加到set中
                if counter.count >= 1 {
                    counter[0].insert(char)
                }
                else {
                    var set = Set<Character>()
                    set.insert(char)
                    counter.append(set)
                }
            }
        }
        
        let conterLength = counter.count
        var newStr = ""
        
        for i in (0..<conterLength).reversed() {
            let charSet = counter[i]
            for char in charSet {
                newStr.append(contentsOf: String(repeating: char, count: i+1))
            }
        }
        
        return newStr
    }
}
