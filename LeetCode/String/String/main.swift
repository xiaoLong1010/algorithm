//
//  main.swift
//  String
//
//  Created by Csy on 2019/2/25.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

func test151() -> Void {
    let answer = ReverseWords()
    
    let result = answer.reverseWords("the sky is blue")
    
    print("result",result)
}
test151()

func test43() -> Void {
    let answer = MultiplyStrings()
    
    let result = answer.multiply("123", "10")
    
    print("result",result)
}
//test43()

func test567() -> Void {
    let answer = CheckInclusion()
    
    let result = answer.checkInclusion("ab", "eidbaooo")
    
    print("result",result)
}
test567()

func test14() -> Void {
    let answer = LongestCommonPrefix()
    
    let strs = ["dog","racecar","car"]
    
    let result = answer.longestCommonPrefix(strs)
    
    print("result",result)
}
test14()

