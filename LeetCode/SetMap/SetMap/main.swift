//
//  main.swift
//  SetMap
//
//  Created by Csy on 2019/1/9.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test447_numOfBoomerangs() -> Void {
    let answer = NumOfBoomerangs()
    
    let result = answer.solution1([[0,0],[1,0],[2,0]])
    print(result)
}
test447_numOfBoomerangs()

func test18_FourSum() -> Void {
    let answer = FourSum()
    
    let result = answer.solution1([1, 0, -1, 0, -2, 2],0)
    print(result)
}
//test18_FourSum()

func test15_ThreeSum() -> Void {
    let answer = ThreeSum()
    
    let result = answer.solution1([-1, 0, 1, 2, -1, -4])
    print(result)
}
//test15_ThreeSum()

