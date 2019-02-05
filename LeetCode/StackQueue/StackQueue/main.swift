//
//  main.swift
//  StackQueue
//
//  Created by Csy on 2019/1/4.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test150() -> Void {
    let answer = EvalRPN()
    
    let nums = ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
    let result = answer.solution1(nums)
    print("result: ", result)
}
test150()

func test347_TopKFrequentNums() -> Void {
    let answer = TopKFrequentNums()
    
    let nums = [2,2,1,1,1,3]
    let result = answer.solution1(nums, 2)
    print("result: ", result!)
}
//test347_TopKFrequentNums()

