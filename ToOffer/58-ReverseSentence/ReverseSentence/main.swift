//
//  main.swift
//  ReverseSentence
//
//  Created by Csy on 2018/11/19.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func reverseSentence(s: String?) -> String? {
    guard s != nil else {
        return nil
    }
    
    // 把String变成字符数组
    var chars = Array(s!), start = 0
    let length = chars.count
    
    // 整体翻转
    _reverse(&chars, 0, length - 1)
    
    // 走到空格或者最后一个字符，就再次翻转
    for i in 0 ..< length {
        if i == length - 1 || chars[i + 1] == " " {
            _reverse(&chars, start, i)
            start = i + 2
        }
    }
    return String(chars)
}

func _reverse<T>(_ chars: inout [T], _ start: Int, _ end:Int){
    var start = start, end = end
    while start < end {
        _swap(&chars,start,end)
        start += 1
        end -= 1
    }
}

func _swap<T>(_ chars: inout [T], _ p: Int, _ q: Int) {
    (chars[p], chars[q]) = (chars[q], chars[p])
}

func reverseSentence2(s: String?) -> String? {
    guard s != nil else {
        return nil
    }
    
    //翻转整体字符串
    let chars4 = String(s!.reversed())
    print(chars4)
    
    var startIdx = s!.startIndex, endIdex = s!.endIndex
    var result = String()
    
    //逐个单词进行翻转，然后拼接
    while let comma = chars4[startIdx..<endIdex].index(of: " ") {
        
        result.append(String(chars4[startIdx..<comma].reversed()) + " ")
        startIdx = chars4.index(after: comma)
    }
    result.append(String(chars4[startIdx..<endIdex].reversed()))
    print(result)
    
    return String(result)
}

func reverseString(_ str: String?, atIndex index:NSInteger) -> String? {
    guard str != nil else {
        return nil
    }
    
    var chars = Array(str!)
    let length = chars.count
    if index >= length {
        return nil
    }
    
    // 翻转前半部分
    _reverse(&chars, 0, index)
    // 翻转后半部分
    _reverse(&chars, index + 1, length - 1)
    // 整体翻转
    _reverse(&chars, 0, length - 1)
    
    return String(chars)
}

var sentence = "I am a student"
var reversedSentence = reverseSentence(s: sentence)

var str = "znihaodl"
var reversedStr = reverseString(str, atIndex: 2)
print(str)






/*
作者：Harveyhhw
链接：https://www.jianshu.com/p/cb3ed74c0732
來源：简书
简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
*/

