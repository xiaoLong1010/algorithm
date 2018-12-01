//
//  main.swift
//  DeleteNode
//
//  Created by Csy on 2018/12/1.
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

func deleteDuplication(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return nil
    }
    
    var newHeader = head
    var node1: ListNode? = nil
    var node2 = head
    
    while node2?.next != nil {
        var nextNode = node2!.next
        
        if nextNode?.value != node2?.value {
            node1 = node2
            node2 = nextNode
        } else {        // 相同的node
            while nextNode?.next != nil && nextNode?.next?.value == node2?.value {
                nextNode = nextNode?.next
            }
            node2 = nextNode?.next
            
            if node1 == nil {       // 说明头节点就有重复的，那就要更换头节点
                newHeader = node2
            } else {
                node1?.next = node2
            }
        }
    }
    return newHeader
}

var node1 = ListNode(1)
var node2 = ListNode(1)
var node3 = ListNode(2)
var node4 = ListNode(5)
var node5 = ListNode(3)
var node6 = ListNode(1)
var node7 = ListNode(1)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7
node7.next = nil

var head = deleteDuplication(node1)
print(head ?? "")
