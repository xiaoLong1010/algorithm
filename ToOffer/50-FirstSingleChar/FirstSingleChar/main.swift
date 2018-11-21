//
//  main.swift
//  FirstSingleChar
//
//  Created by Csy on 2018/11/21.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func firtSingleChar(_ str: String?) -> Character? {
    guard str != nil else {
        return nil
    }
    
//    var chars = Array(str)
    var charInfo = Dictionary<Character, Int>()
    var index = -1
    
    // 出现一次的char，放到字典中
    for char in str! {
        index += 1
        
        if charInfo[char] == nil {
            charInfo[char] = index
        } else {
            charInfo.removeValue(forKey: char)
        }
    }
    
    // 遍历字典的value，找到最早出现的char
    var first = charInfo.first!
    for item in charInfo {
        if item.value < first.value {
            first = item
        }
    }
    return first.key
}


var str = "123123dfghjfd"
print(firtSingleChar(str)!)


//var str = "张三"
//var arr = Array(str)
//print(arr[0])
//print(arr[1])
