//
//  93-RestoreIpAddresses.swift
//  Backtracking
//
//  Created by Csy on 2019/2/6.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class RestoreIpAddresses {
    private var result = Array<String>()
    
    func solution1(_ s: String) -> [String] {
        if s.count == 0 {
            return []
        }
        let chars = Array(s)
        for i in 0...2 {
            self.findIP(chars, 0, 0...i, "")
        }
    
        return self.result
    }
    
    /// 
    ///
    /// - Parameters:
    ///   - chars: 字符数组
    ///   - section: ip地址中的当前段
    ///   - range: 当前段在地址中的范围
    ///   - combinaIP: 之前的ip字符串
    func findIP(_ chars: [Character], _ section:Int, _ range:ClosedRange<Int>, _ combinaIP: String) -> Void {
        let charCount = chars.count
        
        // 先判断rang是否合适
        if range.upperBound >= charCount {
            return
        }
        
        // 再判断当前section的数字，是否合法
        let sectionFirstChar = chars[range.lowerBound]
        if sectionFirstChar == "0" && range.count > 1 {
            return
        }
        let sectionStr = String(chars[range])
        let sectionNum = Int(sectionStr)!
        if sectionNum > 255 || sectionNum < 0 {
            return
        }
        
        // 如果是第4段
        if section == 3 {
            // 计算是否使用最后一个字符
            if range.upperBound != charCount - 1 {
                return
            }
            let newIP = combinaIP + sectionStr
            self.result.append(newIP)
            return
        }
        
        // 继续去查找下一个section
        let nextStart = range.upperBound+1
        if nextStart >= chars.count {
            return
        }
        
        for i in 0...2 {
            self.findIP(chars, section+1, nextStart...(nextStart+i), combinaIP+sectionStr+".")
        }
    }
}
