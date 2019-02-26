//
//  567-CheckInclusion.swift
//  String
//
//  Created by Csy on 2019/2/25.
//  Copyright © 2019 CXL. All rights reserved.
//

/***
 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。
 换句话说，第一个字符串的排列之一是第二个字符串的子串。
 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
 
 思路1
    1 在s2中使用双指针，长度等于s1
    2 在s2的这个窗口中，用字典保存每个字符出现的次数，判断是否和s中的相等
 */

import Foundation

class CheckInclusion {
    private var used = Array<Bool>()
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let count1 = s1.count
        let count2 = s2.count
        if count1 == 0 {
            return true
        }
        if count1 > count2 {
            return false
        }
        
        let chars1 = Array(s1)
        let chars2 = Array(s2)
        
        // key是字符，value是字符数量
        var strInfo1 = Dictionary<Character, Int>()
        var strInfo2 = Dictionary<Character, Int>()
        
        // 遍历s1，s2前半段字符
        for i in 0..<count1 {
            let char1 = chars1[i]
            self.addChar(&strInfo1, char1)
            
            let char2 = chars2[i]
            self.addChar(&strInfo2, char2)
        }
        
        if strInfo1 == strInfo2 {
            return true
        }
        
        // 遍历s2剩余的字符
        for i in count1..<count2 {
            let addChar = chars2[i]
            self.addChar(&strInfo2, addChar)
            
            let removeChar = chars2[i-count1]
            self.removeChar(&strInfo2, removeChar)
            
            if strInfo1 == strInfo2 {
                return true
            }
        }
        
        return false
    }
    
    func addChar(_ info: inout Dictionary<Character, Int>, _ c: Character) -> Void {
        if let count = info[c] {
            info[c] = count + 1
        } else {
            info[c] = 1
        }
    }
    
    func removeChar(_ info: inout Dictionary<Character, Int>, _ c: Character) -> Void {
        if let count = info[c] {
            if count > 1 {
                info[c] = count - 1
            } else {
                info.removeValue(forKey: c)
            }
        }
    }
    
    func checkInclusion2(_ s1: String, _ s2: String) -> Bool {
        let count = s1.count
        if count == 0 {
            return true
        }
        
        self.used = Array<Bool>(repeating: false, count: count)
        let chars = Array(s1)
        var perm = Array<Character>()
        var isContain = false
        
        // 对s1进行全排列，并且判断s2是否包含其中一个全排列
        self.generatePermutation(s2, chars, 0, &perm, &isContain)
        
        return isContain
    }
    
    // chars是总的字符列表
    // perm是0到index-1，已经全排列的
    func generatePermutation(_ str: String, _ chars: Array<Character>, _ currentIndex: Int, _ perm: inout Array<Character>, _ isContain: inout Bool) -> Void {
        if isContain {
            return
        }
        // 全排列已经完成了
        if currentIndex == chars.count {
            if str.contains(String(perm)) {
                isContain = true
            }
            return
        }
        
        let count = chars.count
        
        // 去重
        var set = Set<Character>()
        
        for index in 0..<count {
            let char = chars[index]
            
            if !used[index] && !set.contains(char) {
                set.insert(char)
                used[index] = true
                perm.append(char)
                
                generatePermutation(str, chars, currentIndex+1, &perm, &isContain)
                
                // 必须要返回去
                perm.removeLast()
                used[index] = false
            }
        }
    }
}
