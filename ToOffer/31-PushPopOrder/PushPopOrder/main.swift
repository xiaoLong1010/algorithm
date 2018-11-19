//
//  main.swift
//  PushPopOrder
//
//  Created by Csy on 2018/11/19.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func isPopOrder(_ pushElements: [Int], _ popElements: [Int]) -> Bool {
    if pushElements.count != popElements.count {
        return false
    }
    
    let length = pushElements.count
    var pushIndex = 0
    var popIndex = 0
    var stack = Stack<Int>()
    
    // 遍历popElements，看栈顶元素是否和遍历元素相等
    while popIndex < length {
        if stack.isEmpty() || stack.peek() != popElements[popIndex] {
            if pushIndex < length {
                stack.push(pushElements[pushIndex])
                pushIndex += 1
            } else {
                return false
            }
        } else {
            stack.pop()
            popIndex += 1
        }
    }
    
    return true
}

var pushList = [1,2,3,4,5]
var popList1 = [4,5,3,2,1]
var popList2 = [4,3,5,1,2]


var  result1 = isPopOrder(pushList, popList1)
var  result2 = isPopOrder(pushList, popList2)

print(result1)
