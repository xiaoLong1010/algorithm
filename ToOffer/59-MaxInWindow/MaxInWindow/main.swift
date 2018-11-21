//
//  main.swift
//  MaxInWindow
//
//  Created by Csy on 2018/11/20.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

struct Deque<T> {
    private var array = [T]()
    //判空
    var isEmpty: Bool {
        return array.isEmpty
    }
    var count: Int {
        return array.count
    }
    //从队尾入队
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    //从队首入队
    mutating func enqueueFront(_ element: T) {
        array.insert(element, at: 0)
    }
    //从队首出队
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    //从队尾出队
    mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    //查看队首元素
    func peekFront() -> T? {
        return array.first
    }
    //查看队尾元素
    func peekBack() -> T? {
        return array.last
    }
}

struct QueueWithMax<T: Comparable> {
    private var array = [WrapData]()
    private var maxArray = [WrapData]()
    private var lastIndex = -1       //队列中最后一个元素加进来时，给的序号
    private struct WrapData {
        var value: T
        var index: Int
    }
    
    //从队尾入队
    mutating func enqueue(_ element: T) {
        lastIndex += 1
        
        // 加入的元素，一定要把maxArray中较小的元素移除
        while maxArray.count > 0 && maxArray.last!.value <= element {
            maxArray.removeLast()
        }
        let value = WrapData(value: element,index: lastIndex)
        
        array.append(value)
        maxArray.append(value)
    }
    
    //从队首出队
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            let data = array.removeFirst()
            if maxArray.first!.index == data.index {
                maxArray.removeFirst()
            }
            return data.value
        }
    }
    
    func max() -> T? {
        if isEmpty {
            return nil
        } else {
            return maxArray.first?.value
        }
    }
    
    //判空
    var isEmpty: Bool {
        return array.isEmpty
    }
    var count: Int {
        return array.count
    }

}




func maxInWindow(_ list: Array<Int>?, _ size: Int) -> Array<Int>? {
    guard list != nil && list!.count > size else {
        return nil
    }
    
    var resultList = Array<Int>()
    let length = list!.count
    var window = Deque<Int>()
    
    // 把最大值的索引放到前面，从队列移除较小的值
    for index in 0..<size {
        let newValue = list![index]
        while window.peekBack() != nil &&  list![window.peekBack()!] < newValue {
            window.dequeueBack()
        }
        window.enqueue(index)
    }
    resultList.append(list![window.peekFront()!])
    
    for index in size..<length {
        // 把最大的索引放到前面，从队列移除较小的值
        let newValue = list![index]
        while window.peekBack() != nil &&  list![window.peekBack()!] < newValue {
            window.dequeueBack()
        }
        
        // 最大的索引被移出去了
        if window.peekFront() != nil && (index - size) >= window.peekFront()! {
            window.dequeue()
        }
        window.enqueue(index)
        resultList.append(list![window.peekFront()!])
    }
    
    return resultList
}

var list = [2,3,4,2,6,2,5,1]
var maxWindowList = maxInWindow(list, 3)

//print(maxWindowList ?? "")

var queue = QueueWithMax<Int>()
queue.enqueue(2)
print(queue.max() ?? "empty")

queue.enqueue(3)
print(queue.max() ?? "empty")

queue.enqueue(4)
print(queue.max() ?? "empty")

queue.dequeue()
print(queue.max() ?? "empty")

queue.enqueue(5)
print(queue.max() ?? "empty")

queue.enqueue(2)
print(queue.max() ?? "empty")

queue.dequeue()
queue.dequeue()
queue.dequeue()
print(queue.max() ?? "empty")

queue.dequeue()
print(queue.max() ?? "empty")

