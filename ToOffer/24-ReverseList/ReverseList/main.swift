//
//  main.swift
//  ReverseList
//
//  Created by Csy on 2018/11/18.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.value = val
        self.next = nil
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var pre: ListNode? = nil
    var cur: ListNode? = head
    
    while cur != nil {
        // 先保留下一个结点的信息
        let post = cur?.next
        
        // 当前结点的next指针进行反转
        cur?.next = pre
        
        // 结点向右走一步
        pre = cur
        cur = post
    }
    return pre
}

func printList(_ head: ListNode?) -> Void {
    var node = head
    
    while node != nil {
        print(node!.value)
        node = node?.next
    }
}

var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(3)
var node4 = ListNode(4)
var node5 = ListNode(5)
var node6 = ListNode(6)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = nil

var reversedHead = reverseList(node1)

printList(reversedHead)
