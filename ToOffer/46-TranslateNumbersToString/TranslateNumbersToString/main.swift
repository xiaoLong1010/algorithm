//
//  main.swift
//  TranslateNumbersToString
//
//  Created by Csy on 2018/11/28.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

// f(r-2) = f(r-1) + g(r-2,r-1) * f(r)
//
func count(_ chars: Array<Character>) -> Int {
    let length = chars.count
    
    if length == 1 {
        return 1
    }
    
    // 先求出初始的f(length-1),f(length-2)
    var rValue = 1
    var r_1Value = 1
    
    let digit1 = toNum(chars[length - 1])
    let digit2 = toNum(chars[length - 2])
    let combine = digit2 * 10 + digit1
    if combine >= 10 && combine <= 25 {
        r_1Value = 2
    }
    var count = r_1Value
    
    // 逆序遍历数组
    for index in (0..<length-2).reversed() {
        // 计算g
        var  g = 0
        let digit1 = toNum(chars[index])
        let digit2 = toNum(chars[index + 1])
        let combine = digit1 * 10 + digit2
        if combine >= 10 && combine <= 25 {
            g = 1
        }
        
        // 计算count
        let temp = r_1Value
        count = r_1Value + g * rValue
        
        // 更新r_1Value，rValue
        r_1Value = count
        rValue = temp
    }
    return count
}

func transCount(_ num: Int) -> Int {
    if num < 0 {
        return 0
    }
    let chars = Array("\(num)")
    return count(chars)
}

func toNum(_ char: Character) -> Int {
    let intValue = Int(String(char))
    if let value = intValue {
        return value
    } else {
        return 0
    }
}

var count1 = transCount(101)
print(count1)

count1 = transCount(12258)
print(count1)

count1 = transCount(12218)
print(count1)


