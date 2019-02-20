//
//  main.swift
//  DynamicProgramming
//
//  Created by Csy on 2018/12/25.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func test139() -> Void {
    let answer  = WordBreak()
    let s = "leetcode"
    let words = ["leet", "code"]
    
    let result1 = answer.wordBreak(s, words)
    print("result1 :" ,result1)
}
test139()

func test474() -> Void {
    let answer  = FindMaxForm()
    let strs = ["10", "0001", "111001", "1", "0"]
    let m = 5
    let n = 3

    let result1 = answer.findMaxForm2(strs, m, n)
    print("result1 :" ,result1)
}
test474()

func test337() -> Void {
    let answer  = Rob3()
    let node1 = TreeNode(3)
    let node2 = TreeNode(4)
    let node3 = TreeNode(5)
    let node4 = TreeNode(1)
    let node5 = TreeNode(3)
    let node6 = TreeNode(1)
    
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    node3.right = node6
    
    let result1 = answer.rob(node1)
    print("result1 :" ,result1)
}
//test337()

func test93() -> Void {
    let answer  = UniquePathsWithObstacles()
    let nums = [[0,1]]
    
    let result1 = answer.uniquePathsWithObstacles(nums)
    print("result1 :" ,result1)
}
test93()

func test91() -> Void {
    let answer  = NumDecodings()
    let nums = "226"
    
    let result1 = answer.numDecodings(nums)
    print("result1 :" ,result1)
}
test91()

func test213() -> Void {
    let robber  = Rob2()
    let nums = [2,3,2]
    
    let result1 = robber.solution1(nums)
    print("result1 :" ,result1)
}
test213()

func testLCS2() -> Void {
    let lcs = LongestCommonSubString()
    let result1 = lcs.solution1("ABCBDEFBWD","BCBWD")
    print(result1)
}
//testLCS2()

func testLPS() -> Void {
    let lps = LongestPalindromicSubstring()
    let result1 = lps.solution1("abbacdeedc")
    print(result1)
}
//testLPS()

func testLCS() -> Void {
    let lcs  = LongestCommonSubsequence()
    var str1 = "23"
    var str2 = "1234"

    var result1 = lcs.solution1(str1, str2)
    print("result1 :" ,result1)
    var result2 = lcs.solution2(str1, str2)
    print("result2 :" ,result2)
    
    str1 = "ABCDGH"
    str2 = "AEDFHR"
    result1 = lcs.solution1(str1, str2)
    print("result1 :" ,result1)
    result2 = lcs.solution2(str1, str2)
    print("result2 :" ,result2)
    
    str1 = "AAACCGTGAGTTATTCGTTCTAGAA"
    str2 = "CACCCCTAAGGTACCTTTGGTTC"
    result1 = lcs.solution1(str1, str2)
    print("result1 :" ,result1)
    result2 = lcs.solution2(str1, str2)
    print("result2 :" ,result2)
}
//testLCS()

func testLIS() -> Void {
    let lis  = LongestIncreaseSubsequence()
    let nums = [1, 3, 6, 7, 9, 4, 10, 5, 6]
    
    let result1 = lis.solution1(nums)
    print("result1 :" ,result1)
    
    let result2 = lis.solution2(nums)
    print("result2 :" ,result2)
}
testLIS()

func testKnapsack() -> Void {
    let sack  = Knapsack()
    let values = [6,10,12]
    let weights = [1,2,3]

    let result1 = sack.solution1(values: values, weights: weights, maxCapacity: 5)
    print("result1 :" ,result1)
    
    let result2 = sack.solution2(values: values, weights: weights, maxCapacity: 5)
    print("result2 :" ,result2)
}
//testKnapsack()

func testHouseRobber198() -> Void {
    let robber  = HouseRobber()
    let nums = [2,7,9,3,1]
    
    let result1 = robber.solution1(nums)
    print("result1 :" ,result1)
    
    let result2 = robber.solution2(nums)
    print("result2 :" ,result2)
    
    let result3 = robber.solution3(nums)
    print("result3 :" ,result3)
}
//testHouseRobber198()

func testIntegerBreak343() -> Void {
    let breaker  = IntegerBreak()
    
    let result1 = breaker.solution1(10)
    print("result1 :" ,result1)
    
    let result2 = breaker.solution2(10)
    print("result2 :" ,result2)
    
    let result3 = breaker.solution3(10)
    print("result3 :" ,result3)
}
//testIntegerBreak343()

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

