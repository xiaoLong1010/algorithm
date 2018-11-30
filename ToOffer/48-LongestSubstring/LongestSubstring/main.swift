//
//  main.swift
//  LongestSubstring
//
//  Created by Csy on 2018/11/30.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func longestSubstring(_ chars: Array<Character>) -> Int {
    // 0个或者1个字符
    if chars.count <= 1 {
        return chars.count
    }
    let length = chars.count
    var charSet = Set<Character>()
    var count = 0
    
    // left是子字符串的起始位置，right是结束位置
    var left = 0
    for right in 0..<length {
        // 如果char之前已经出现了
        // 那就把之前的char以及其左边的字符，都从charSet删除
        // 从之前char的右边第一个字符开始，组成新的子字符串
        let char = chars[right]
        while charSet.contains(char) && left <= right {
            charSet.remove(chars[left])
            left += 1
        }
        
        charSet.insert(char)
        count = max(count, right - left + 1)
    }
    return count
}

func longestSubstring2(_ chars: Array<Character>) -> Int {
    // 0个或者1个字符
    if chars.count <= 1 {
        return chars.count
    }
    let length = chars.count
    var charInfo = Dictionary<Character, Int>()
    var count = 0
    
    // left是子字符串的起始位置，right是结束位置
    var left = 0
    for right in 0..<length {
        // 如果char之前已经出现了
        // 从之前char的右边第一个字符开始，组成新的子字符串
        // charInfo[char]! >= left，确认char是在子字符串范围
        let char = chars[right]
        if charInfo[char] != nil && charInfo[char]! >= left{
            left = charInfo[char]! + 1
        }
        charInfo[char] = right
        
        // 比较已经存在的count和现在字符串
        count = max(count, right - left + 1)
    }
    return count
}

var str = "arabcacfr"
var count = longestSubstring2(Array(str))
print(count)
