//
//  290-WordPattern.swift
//  SetMap
//
//  Created by Csy on 2019/1/30.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一种 pattern(模式) 和一个字符串 str ，判断 str 是否遵循相同的模式。
 
 这里的遵循指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应模式。
 
 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true
 
 输入:pattern = "abba", str = "dog cat cat fish"
 输出: false
 */
import Foundation

class WordPattern {
    func solution1(_ pattern: String, _ str: String) -> Bool {
        var patterns = Array(pattern)
        var words = str.components(separatedBy: " ")
        
        // 数量必须相等
        let count = patterns.count
        if count != words.count {
            return false
        }
        
        // 一个模式字符，对应一个字符串
        var patternInfo = Dictionary<Character, String>()
        for i in 0..<count {
            let patternChar = patterns[i]

            if let targetWord = patternInfo[patternChar] {
                if targetWord != words[i] {
                    return false
                }
            } else {
                // 单词不能已经被用过
                let word = words[i]
                if patternInfo.values.contains(word) {
                    return false
                }
                
                // 将单词保存起来
                patternInfo[patternChar] = word
            }
        }
        return true
    }
}
