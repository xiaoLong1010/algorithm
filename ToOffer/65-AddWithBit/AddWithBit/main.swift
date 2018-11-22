//
//  main.swift
//  AddWithBit
//
//  Created by Csy on 2018/11/22.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func add(_ num1: inout Int, _ num2: inout Int) -> Int {
    var sum = 0
    var carry = 0
    
    repeat {
        sum = num1 ^ num2
        carry = (num1 & num2) << 1
        
        num1 = sum
        num2 = carry
    } while(carry != 0)
    
    return sum
}

func add2(_ num1: inout Int, _ num2: inout Int) -> Int {
    var carry = (num1 & num2) << 1
    var sum = num1 ^ num2
    
    if carry == 0 {
        return sum
    }
    
    return add2(&sum, &carry)
}

var num1 = 5
var num2 = 0

var sum = add2(&num1, &num2)

print(sum)




