//
//  151-ReverseWords.swift
//  String
//
//  Created by Csy on 2019/2/26.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class ReverseWords {
    func reverseWords(_ s: String) -> String {
        
        // 将各个单词反转
        var componsts = s.split(separator: " ")
        componsts = componsts.reversed()
        
        // 反转后的单词拼接起来
        let str = componsts.reduce(""){$0 + $1 + " "}
        
        // 去掉最后一个空格，生成最终的结果
        let result = String(str.dropLast())
        
        return result
    }
}
