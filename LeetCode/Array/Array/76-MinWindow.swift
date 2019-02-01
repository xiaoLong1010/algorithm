//
//  76-MinWindow.swift
//  Array
//
//  Created by Csy on 2019/1/30.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个字符串 S 和一个字符串 T，请在 S 中找出包含 T 所有字母的最小子串
 
 输入: S = "ADOBECODEBANC", T = "ABC"
 输出: "BANC"
 
 说明：
 如果 S 中不存这样的子串，则返回空字符串 ""。
 如果 S 中存在这样的子串，我们保证它是唯一的答案。
 */
import Foundation

class MinWindow {
    func solution1(_ s: String, _ t: String) -> String {
        let sChars = Array(s)
        let length = sChars.count
        let tLength = t.count
        var leftCount = tLength     // p中还剩余未匹配字符个数
        
        // 初始的字符个数
        var counter = Dictionary<Character, Int>()
        for char in t {
            if let count = counter[char] {
                counter[char] = count + 1
            } else {
                counter[char] = 1
            }
        }
        
        // 窗口,[start,end]
        var resultStart = 0
        var resultEnd = length
        
        var start = 0
        var end = 0
        
        while end < length {
            let char = sChars[end]
            
            // 该字符是否也在t字符串中
            if let charCount = counter[char]  {
                // charCount必须大于0，说明p中还有该字符
                // 否则说明，该相同字符在s中有很多个，p中没有足够多
                if charCount > 0 {
                    leftCount -= 1
                }
                counter[char] = charCount - 1
            }
            
            // 如果区间包含t字符串
            // 跟之前保留的最小长度区间进行比较
            // 尝试缩小区间
            if leftCount == 0 {
                // 保留较小的区间
                let currentLength = end - start + 1
                let resultLength = resultEnd - resultStart + 1
                if currentLength < resultLength {
                    resultStart = start
                    resultEnd = end
                }
                
                // 尝试缩小区间
                while start < end {
                    let startChar = sChars[start]
                    if let charCount = counter[startChar] {
                        // 将包含的字符串移除了，此时区间不满足条件了，需要跳出去，end++，调整区间长度，看是否有更小满足条件的区间
                        if charCount >= 0 {
                            leftCount += 1
                            start += 1
                            counter[startChar] = charCount + 1
                            break
                        }
                        counter[startChar] = charCount + 1
                    }
                    start += 1
                    
                    // 保留较小的区间
                    let currentLength = end - start + 1
                    let resultLength = resultEnd - resultStart + 1
                    if currentLength < resultLength {
                        resultStart = start
                        resultEnd = end
                    }
                }
            }
            
            end += 1
        }
        
        if resultEnd != length {
            return String(sChars[resultStart...resultEnd])
        } else {
            return ""
        }
    }
}
