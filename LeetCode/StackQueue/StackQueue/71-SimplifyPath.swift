//
//  71-SimplifyPath.swift
//  StackQueue
//
//  Created by Csy on 2019/2/14.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 以 Unix 风格给出一个文件的绝对路径，你需要简化它。或者换句话说，将其转换为规范路径。
 请注意，返回的规范路径必须始终以斜杠 / 开头，并且两个目录名之间必须只有一个斜杠 /。最后一个目录名（如果存在）不能以 / 结尾。此外，规范路径必须是表示绝对路径的最短字符串。
 
 思路一
    1 将字符串使用"/"进行分割。Swfit的分割函数的结果中，"/"会被替换成""
    2 根据字符，"."，""，".."进行出栈和入栈操作
    3 最后再进行路径拼接
 */

import Foundation

class SimplifyPath {
    func solution1(_ path: String) -> String {
        let paths = path.components(separatedBy:"/")
        var stack = [String]()
        for str in paths {
            if str == "." || str == ""{
                
            } else if str == ".." {
                _ = stack.popLast()
            } else {
                stack.append(str)
            }
        }
        
        var result = "/"
        for i in 0..<stack.count {
            let str = stack[i]
            if i == stack.count - 1 {
                result += str
            } else {
                result += str + "/"
            }
        }
        
        return result
    }
}
