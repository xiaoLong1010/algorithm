//
//  Stack.swift
//  BinaryTree
//
//  Created by Csy on 2018/12/17.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

/// 实现一个基本的栈结构
struct Stack<T> {
    
    /// 声明一个泛型数组，用于存储栈中的元素(栈结构的后备存储器)
    private var elements = [T]()
    
    /// 使用push方法执行入栈操作
    public mutating func push(_ element: T) {
        // 使用数组的append()方法将元素添加到数组elements中
        self.elements.append(element)
    }
    
    /// 使用pop方法执行出栈操作
    @discardableResult
    public mutating func pop() -> T? {
        // 移除数组elements的最后一个元素
        return elements.popLast()
    }
    
    /// 返回栈顶元素
    public func peek() -> T? {
        // 返回数组elements的最后一个元素(但是不移除该元素)
        return elements.last
    }
    
    /// 返回栈结构中元素的个数
    public var count: Int {
        // 返回数组elements中的元素个数
        return elements.count
    }
    
    /// 初始化方法(创建栈实例)
    public init() {}
    
    /// 清空栈中所有的元素
    public mutating func clear() {
        // 清空数组elements中所有的元素
        elements.removeAll()
    }
    
    /// 判断栈是否为空
    public func isEmpty() -> Bool {
        // 判断数组elements是否为空
        return elements.isEmpty
    }
}
