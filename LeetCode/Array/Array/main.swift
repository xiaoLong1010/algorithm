//
//  main.swift
//  Array
//
//  Created by Csy on 2019/1/6.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test3_LongestSubstring() -> Void {
    let answer = LongestSubstring()
    let result = answer.solution4("bbbb")
    print("result:", result)
}
test3_LongestSubstring()

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
    answer.solution1(&nums)
    print("nums: ",nums)
}
//test283_MoveZeros()

