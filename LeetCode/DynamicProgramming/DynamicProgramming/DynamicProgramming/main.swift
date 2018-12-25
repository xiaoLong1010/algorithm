//
//  main.swift
//  DynamicProgramming
//
//  Created by Csy on 2018/12/25.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func testIntegerBreak343() -> Void {
    let breaker  = IntegerBreak()
    
    let result1 = breaker.solution1(10)
    print("result1 :" ,result1)
    
    let result2 = breaker.solution2(10)
    print("result2 :" ,result2)
    
    let result3 = breaker.solution3(10)
    print("result3 :" ,result3)
}
testIntegerBreak343()

// f(n) = f(n-1) + f(n-2)
func Fibonacci(_ num: Int) -> Int {
    if num <= 0 {
        return 0
    }
    
    if num == 1 || num == 2{
        return 1
    }
    
    return Fibonacci(num - 1) + Fibonacci(num - 2)
}

// 存放计算好的结果
var historyList = Array<Int>()
func Fibonacci2(_ num: Int) -> Int {
    if num <= 0 {
        return 0
    }
    
    if num == 1 || num == 2{
        return 1
    }
    
    // 先看有没有计算好的数据
    if historyList[num] <= 0 {
        historyList[num] = Fibonacci(num - 1) + Fibonacci(num - 2)
    }
    
    return historyList[num]
}

func Fibonacci3(_ num: Int) -> Int {
    if num <= 0 {
        return 0
    }
    
    historyList[1] = 1
    historyList[2] = 1
    
    // 从下到上，拿子结果的数据，计算更高层级的数据
    for index in 3...num {
        historyList[index] = historyList[index-1] + historyList[index-2]
    }
    return historyList[num]
}

func testFibonacci() -> Void {
    let num = 20
    
    let result1 = Fibonacci(num)
    print("result1 :",result1)
    
    historyList = Array(repeating: -1, count: num+1)
    let result2 = Fibonacci2(num)
    print("result2 :",result2)
    
    let result3 = Fibonacci3(num)
    print("result3 :",result3)
}

