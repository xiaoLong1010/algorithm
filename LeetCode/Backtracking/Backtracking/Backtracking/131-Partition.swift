//
//  131-Partition.swift
//  Backtracking
//
//  Created by Csy on 2019/2/21.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。
 返回 s 所有可能的分割方案。
 
 输入: "aab"
 输出:
 [
 ["aa","b"],
 ["a","a","b"]
 ]
 */

import Foundation

class Partition {
    var results = [[String]]()
    
    func partition(_ s: String) -> [[String]] {
        let length = s.count
        if length == 0 {
            return []
        }
        var aList = [String]()
        let chars = Array(s)
        
        self.partitionCore(chars, start: 0, subReults: &aList)
        
        return self.results
    }
    
    func partitionCore(_ chars: [Character], start: Int, subReults: inout [String]) -> Void {
        let count = chars.count
        if  start == count && subReults.count > 0 {
            self.results.append(subReults)
            return
        }
        
        // 依次取[0]，[0,1],[0,2]的字符串，先判断自己是否为回文
        // 再递归判断剩下的字符串
        // 中间结果都放到subReults
        for end in start..<count {
            if isPalindrome(chars, start, end) {
                subReults.append(String(chars[start...end]))
                self.partitionCore(chars, start: end+1, subReults: &subReults)
                subReults.removeLast()
            }
        }
    }
    
    func isPalindrome(_ chars: [Character], _ start: Int, _ end: Int) -> Bool {
        var i = start
        var j = end
        
        while i < j {
            if chars[i] != chars[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}
