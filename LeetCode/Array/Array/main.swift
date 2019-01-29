//
//  main.swift
//  Array
//
//  Created by Csy on 2019/1/6.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test438() -> Void {
    let answer = FindAnagrams()
    //    let nums = [3,2,3,1,2,4,5,5,6]
    let result = answer.solution2("cbaebabacd","abc")
    print("result:", result)
}
test438()

func test125() -> Void {
    let answer = IsPalindrome()
//    let nums = [3,2,3,1,2,4,5,5,6]
    let result = answer.solution1("ab2a")
    print("result:", result)
}
//test125()

func test215() -> Void {
    let answer = FindKthLargest()
    let nums = [3,2,3,1,2,4,5,5,6]
    let result = answer.solution1(nums,4)
    print("result:", result)
}
//test215()

func test26_RemoveDuplicates() -> Void {
    let answer = RemoveDuplicates()
    var nums = [1,1,2]
    let result = answer.solution1(&nums)
    print("result:", result)
}
//test26_RemoveDuplicates()

func test3_LongestSubstring() -> Void {
    let answer = LongestSubstring()
    let result = answer.solution2("abcdcab")
    print("result:", result)
}
//test3_LongestSubstring()

func test209_MinSubArrayLength() -> Void {
    let answer = MinSubArrayLength()
    let result = answer.solution1(7, [2,3,1,2,4,3])
    print("result:", result)
}
//test209_MinSubArrayLength()

func test167_TwoSum2() -> Void {
    let answer = TwoSum2()
    let result = answer.solution1([2, 7, 11, 15], 9)
    print("result:", result)
}
//test167_TwoSum2()

func test75_SortColors() -> Void {
    let answer = SortColors()
    
    var nums = [2,0,2,1,1,0]
    answer.solution1(&nums)
    print("nums: ",nums)
}
//test75_SortColors()

func test283_MoveZeros() -> Void {
    let answer = MoveZeros()
    
    var nums = [0, 1, 0, 3, 12]
    answer.solution2(&nums)
    print("nums: ",nums)
}
//test283_MoveZeros()


