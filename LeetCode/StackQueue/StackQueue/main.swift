//
//  main.swift
//  StackQueue
//
//  Created by Csy on 2019/1/4.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test347_TopKFrequentNums() -> Void {
    let answer = TopKFrequentNums()
    
    let nums = [2,2,1,1,1,3]
    let result = answer.solution1(nums, 2)
    print("result: ", result!)
}
test347_TopKFrequentNums()

