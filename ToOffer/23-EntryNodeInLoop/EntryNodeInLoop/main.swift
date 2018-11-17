//
//  main.swift
//  EntryNodeInLoop
//
//  Created by Csy on 2018/11/17.
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

class EntryNodeInLoop {
    func meetingNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var slow = head
        var fast = head
        
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast {
                return slow
            }
        }
        return nil
    }
    
    func entryNode(_ head: ListNode?) -> ListNode? {
        let meetingNode = self.meetingNode(head)
        if meetingNode == nil {
            return nil
        }
        
        // 计算环的结点数
        var numOfLoop = 1
        var node = meetingNode!.next
        while meetingNode !== node {
            numOfLoop += 1
            node = node!.next
        }
        
        // frontNode先走numOfLoop
        var frontNode = head
        for _ in 0 ..< numOfLoop {
            frontNode = frontNode!.next
        }
        
        var behindNode = head
        while behindNode !== frontNode {
            behindNode = behindNode!.next
            frontNode = frontNode!.next
        }
        
        return behindNode
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
node6.next = node3

var entry = EntryNodeInLoop()
var node = entry.entryNode(node1)

if let nodeVaue = node {
    print(nodeVaue.value)
}




