//
//  main.swift
//  Array
//
//  Created by Csy on 2019/1/6.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test75_SortColors() -> Void {
    let answer = SortColors()
    
    var nums = [2,0,2,1,1,0]
    answer.solution1(&nums)
    print("nums: ",nums)
}
test75_SortColors()

func test283_MoveZeros() -> Void {
    let answer = MoveZeros()
    
    var nums = [0, 1, 0, 3, 12]
    answer.solution1(&nums)
    print("nums: ",nums)
}
//test283_MoveZeros()


