//
//  155-MinStack.swift
//  StackQueue
//
//  Created by Csy on 2019/3/30.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。
 
 push(x) -- 将元素 x 推入栈中。
 pop() -- 删除栈顶的元素。
 top() -- 获取栈顶元素。
 getMin() -- 检索栈中的最小元素。
 
 */

import Foundation

class MinStack {
    private var elements: [Int]
    private var mins: [Int]     // 最后一个数字是最小值
    
    init() {
        self.elements = [Int]()
        self.mins = [Int]()
    }
    
    func push(_ x: Int) {
        self.elements.append(x)
        if self.mins.isEmpty || x < self.mins.last! {
            self.mins.append(x)
        } else {
            self.mins.append(self.mins.last!)
        }
    }
    
    func pop() {
        _ = self.elements.popLast()
        _ = self.mins.popLast()
    }
    
    func top() -> Int {
        return self.elements.last!
    }
    
    func getMin() -> Int {
        return self.mins.last!
    }
}
