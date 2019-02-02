//
//  49-GroupAnagrams.swift
//  SetMap
//
//  Created by Csy on 2019/2/2.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 
 输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
 输出:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 */

import Foundation

class GroupAnagrams {
    
    func solution3(_ strs: [String]) -> [[String]] {
        var result = Dictionary<String,[String]>()
        
        for str in strs {
            let sortedStr = String(str.sorted())
            
            if var list  = result[sortedStr] {
                list.append(str)
                result[sortedStr] = list
            }
            else {
                result[sortedStr] = [str]
            }
        }
        
        return result.map{$0.value}
    }
    
    func solution2(_ strs: [String]) -> [[String]] {
        var result = Dictionary<Dictionary<Character, Int>,[String]>()
        
        for str in strs {
            
            let newCounter = self.toCounter(str)
            
            if var list  = result[newCounter] {
                list.append(str)
                result[newCounter] = list
            }
            else {
                result[newCounter] = [str]
            }
            
        }
        
        return Array(result.values)
    }
    
    // 时间超限
    func solution1(_ strs: [String]) -> [[String]] {
        var result = Dictionary<Dictionary<Character, Int>,[String]>()
        
        for str in strs {
            
            var targetCounter: Dictionary<Character, Int>? = nil
            var targetList: [String]? = nil
            
            for (counter, list) in result {
                if self.isAnagram(counter, str) {
                    targetCounter = counter
                    targetList = list
                    break
                }
            }
            
            // 没有找到相同的，就生成新e的
            if targetCounter == nil {
                let newCounter = self.toCounter(str)
                result[newCounter] = [str]
            }
            else {
                targetList?.append(str)
                result[targetCounter!] = targetList!
            }
        }
        
        return Array(result.values)
    }
    
    func toCounter(_ str: String) -> Dictionary<Character, Int> {
        // 转换成字符数组
        let sChars = Array(str)
        
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
        return counter
    }
    
    func isAnagram(_ counter:Dictionary<Character, Int>, _ str: String) -> Bool {
        let tChars = Array(str)
        var counter = counter
        
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


