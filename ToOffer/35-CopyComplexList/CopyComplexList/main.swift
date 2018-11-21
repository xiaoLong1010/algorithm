//
//  main.swift
//  CopyComplexList
//
//  Created by Csy on 2018/11/20.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class ComplexNode {
    var value: Int
    var next: ComplexNode?
    var arbitrary: ComplexNode?
    
    init(_ val: Int) {
        self.value = val
        self.next = nil
        self.arbitrary = nil
    }
}

func clone(_ head: ComplexNode?) -> Void {
    guard head != nil else {
        return
    }
    
    var node = head
    
    // cloneNode先指向next
    // node在指向cloneNode
    while node != nil {
        let cloneNode = ComplexNode(node!.value)
        cloneNode.next = node?.next
        node?.next = cloneNode
        node = cloneNode.next
    }
}

func connectArbitrary(_ head: ComplexNode?) -> Void {
    guard head != nil else {
        return
    }
    
    var node = head
    
    while node != nil {
        // 设置复制链表的arbitrary
        let cloneNode = node?.next
        cloneNode?.arbitrary = node?.arbitrary?.next
        
        node = cloneNode?.next
    }
}

func split(_ head: ComplexNode?) -> ComplexNode? {
    guard head != nil else {
        return nil
    }
    
    var node = head
    let cloneHead = head?.next
    var cloneNode = cloneHead
    
    while node != nil {
        // 先构造好原链表
        node?.next = cloneNode?.next
        node = node?.next
        
        // 再构造好复制链表
        cloneNode?.next = node?.next;
        cloneNode = cloneNode?.next
    }
    
    return cloneHead;
}

func copy(_ head: ComplexNode?) -> ComplexNode? {
    clone(head)
    connectArbitrary(head)
    return split(head)
}

var node1 = ComplexNode(1)
var node2 = ComplexNode(2)
var node3 = ComplexNode(3)
var node4 = ComplexNode(4)
var node5 = ComplexNode(5)


node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = nil

node1.arbitrary = node4
node2.arbitrary = node3
node3.arbitrary = node5
node4.arbitrary = node2
node5.arbitrary = node1

var copyHead = copy(node1)
print(copyHead ?? "fail")
