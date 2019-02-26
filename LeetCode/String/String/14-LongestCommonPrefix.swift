//
//  14-LongestCommonPrefix.swift
//  String
//
//  Created by Csy on 2019/2/25.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation
class LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // 求出长度最短的字符串
        let shortStr = strs.min(by: { $0.count < $1.count })
        if shortStr == nil {
            return ""
        }
        var minStr = shortStr!
        
        // 从最短字符串逆序进行比较
        var endIndex = minStr.endIndex
        for str in strs {
            if (str.hasPrefix(minStr)) {
                continue
            }
            while endIndex > minStr.startIndex && !str.hasPrefix(minStr) {
                endIndex = minStr.index(before: endIndex)
                minStr = String(minStr[minStr.startIndex..<endIndex])
            }
        }
        return minStr
    }
}
