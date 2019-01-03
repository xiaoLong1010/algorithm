//
//  main.swift
//  Greedy
//
//  Created by Csy on 2019/1/3.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test435_NonOverlappingIntervals() -> Void {
    let object = NonOverlappingIntervals()
    
    let intervals = [ [1,2], [2,3], [3,4], [1,3] ]
    
    let result = object.solution1(intervals)
    print("result: ",result)
}
test435_NonOverlappingIntervals()

func test455_AssignCookies() -> Void {
    let object = AssignCookies()
    
    let g = [1,2]
    let c = [1,2,3]
    let result = object.solution1(g, c)
    print("result: ",result)
}
//test455_AssignCookies()
