//
//  438-FindAnagrams.swift
//  Array
//
//  Created by Csy on 2019/1/29.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个字符串 s 和一个非空字符串 p，找到 s 中所有是 p 的字母异位词的子串，返回这些子串的起始索引。
 字符串只包含小写英文字母，并且字符串 s 和 p 的长度都不超过 20100。
 
 输入:
 s: "cbaebabacd" p: "abc"
 输出:
 [0, 6]
 解释:
 起始索引等于 0 的子串是 "cba", 它是 "abc" 的字母异位词。
 起始索引等于 6 的子串是 "bac", 它是 "abc" 的字母异位词。
 
 思路
    1 将字符串装入到字典
    2 使用两个下标遍历字符串s，不断生成新的字典，判断info1==info2
 
 */

import Foundation

class FindAnagrams {
    func solution2(_ s: String, _ p: String) -> [Int] {
        let sChars = Array(s)
        let length = sChars.count
        let pLength = p.count
        var count = pLength     
        
        var counter = Dictionary<Character, Int>()
        // 初始的字符个数
        for char in p {
            if let count = counter[char] {
                counter[char] = count + 1
            } else {
                counter[char] = 1
            }
        }
        
        var results = [Int]()
        for i in 0..<length {
            let char = sChars[i]
            
            // i所在的元素，也在p字符串中
            if let charCount = counter[char]  {
                // charCount必须大于0，说明p中还有该字符
                // 否则说明，该相同字符在s中有很多个，p中没有足够多
                if charCount > 0 {
                    count -= 1
                }
                counter[char] = charCount - 1
            }
            
            if i >= pLength-1 {
                // 以i结尾的子字符串，是否符合要求
                let start = i-pLength+1
                if count == 0 {
                    results.append(start)
                }
                
                // 将start字符排除掉，即将开始下一轮的判断
                let startChar = sChars[start]
                if let charCount = counter[startChar] {
                    // charCount大于等于0，才说明该字符被进行过 count--操作，
                    if charCount >= 0 {
                        count += 1
                    }
                    counter[startChar] = charCount+1
                }
            }
        }
        
        return results
    }
    
    func solution1(_ s: String, _ p: String) -> [Int] {
        let sChars = Array(s)
        let length = sChars.count
        
        // 字符的个数
        // 初始auxDict1是包含所有的字符，之后找到一个字符，就把该字符放到auxDict2中
        var auxDict1 = Dictionary<Character, Int>()
        var auxDict2 = Dictionary<Character, Int>()
        
        // 初始的字符个数
        for char in p {
            if let count = auxDict1[char] {
                auxDict1[char] = count + 1
            } else {
                auxDict1[char] = 1
            }
        }
        
        var start = 0
        var end = 0
        var results = [Int]()
        
        while true {
            // 先把auxDict2的数据放到auxDict1，保证auxDict1拥有完整的数据
            for (char, count) in auxDict2 {
                if let existCount = auxDict1[char] {
                    auxDict1[char] = count + existCount
                } else {
                    auxDict1[char] = count
                }
            }
            auxDict2.removeAll()
            
            // 首先找到start，start的字符必须在auxDict1中
            while start < length && auxDict1[sChars[start]] == nil {
                start += 1
            }
            if start == length {
                return results
            }
            
            end = start
            while end < length {
                let char = sChars[end]
                if var count = auxDict1[char] {
                    // 减少char在auxDict1的数量
                    count -= 1
                    if count > 0 {
                        auxDict1[char] = count
                    } else {
                       auxDict1.removeValue(forKey: char)
                    }
                    
                    // 把char放到auxDict2
                    if let countInDict2 = auxDict2[char] {
                        auxDict2[char] = countInDict2 + 1
                    } else {
                        auxDict2[char] = 1
                    }
                    
                    // 查看auxDict1的数量，如果为0，就说明找到了
                    // 开启下一次循环
                    if auxDict1.count == 0 {
                        results.append(start)
                        start += 1
                        break
                    }
                } else {
                    // 如果char不存在，移动start，重新开始循环
                    if auxDict2[char] != nil {
                        start += 1
                    } else {
                        start = end + 1
                    }
                    break
                }
                end += 1
            }
            
            if end == length {
                return results
            }
        }
        
        return results
    }
}
