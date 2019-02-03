//
//  main.swift
//  SetMap
//
//  Created by Csy on 2019/1/9.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test149() -> Void {
    let answer = MaxPoints()
    
    
    let result = answer.solution1([Point(0,0), Point(0,0)])
    print(result)
}
test149()

func test49() -> Void {
    let answer = GroupAnagrams()
 
    let result = answer.solution3(["eat", "tea", "tan", "ate", "nat", "bat"])
    print(result)
}
test49()

func test454() -> Void {
    let answer = FourSum2()
    let A = [-1,-1]
    let B = [-1,1]
    let C = [-1,1]
    let D = [1,-1]
    let result = answer.solution1(A,B,C,D)
    print(result)
}
//test454()

func test451() -> Void {
    let answer = FrequencySort()
    
    let result = answer.solution1("cccaaa")
    print(result)
}
//test451()

func test219_ContainsNearbyDuplicate() -> Void {
    let answer = ContainsNearbyDuplicate()
    
    let result = answer.solution2([1,0,1,1],1)
    print(result)
}
//test219_ContainsNearbyDuplicate()

func test447_numOfBoomerangs() -> Void {
    let answer = NumOfBoomerangs()
    
    let result = answer.solution1([[0,0],[1,0],[2,0]])
    print(result)
}
//test447_numOfBoomerangs()

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

