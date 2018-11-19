//
//  main.swift
//  MinInStack
//
//  Created by Csy on 2018/11/19.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

struct MinStack<T: Comparable> {
    
    /// 声明一个泛型数组，用于存储栈中的元素(栈结构的后备存储器)
    private var elements = [T]()
    private var mins = [T]()
    
    /// 使用push方法执行入栈操作
    public mutating func push(_ element: T) {
        self.elements.append(element)
        if mins.count == 0 || element < self.mins.last!{
            self.mins.append(element)
        } else {
            self.mins.append(self.mins.last!)
        }
    }
    
    /// 使用pop方法执行出栈操作
    @discardableResult
    public mutating func pop() -> T? {
        self.mins.popLast()
        return elements.popLast()
    }
    
    @discardableResult
    public mutating func minPeek() -> T? {
        return self.mins.last
    }
    
    /// 返回栈顶元素
    public func peek() -> T? {
        // 返回数组elements的最后一个元素(但是不移除该元素)
        return elements.last
    }

}

var min = MinStack<Int>()

min.push(3)
min.push(4)
min.push(2)
min.push(1)







