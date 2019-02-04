//
//  150-EvalRPN.swift
//  StackQueue
//
//  Created by Csy on 2019/2/4.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 根据逆波兰表示法，求表达式的值。
 
 有效的运算符包括 +, -, *, / 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。
 
 输入: ["2", "1", "+", "3", "*"]
 输出: 9
 解释: ((2 + 1) * 3) = 9
 */


import Foundation
class EvalRPN {
    func solution1(_ tokens: [String]) -> Int {
        var nums = Stack<Int>()
        
        for str in tokens {
            if let num = Int(str) {     // 如果是数字，就保存起来
                nums.push(num)
            }
            else {
                let num2 = nums.pop()!
                let num1 = nums.pop()!
                var middleResult = 0
                
                switch str {
                case "+":
                    middleResult = num1 + num2
                    
                case "-":
                    middleResult = num1 - num2
                    
                case "*":
                    middleResult = num1 * num2
                    
                case "/":
                    middleResult = num1 / num2
                    
                default:
                    break
                }
                nums.push(middleResult)
            }

        }
        
        // 最后一个数就是最终结果
        return nums.pop()!
    }
}
