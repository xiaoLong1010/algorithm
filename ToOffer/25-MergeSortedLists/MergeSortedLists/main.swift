//
//  main.swift
//  MergeSortedLists
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

func merge1(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
    if head1 == nil {
        return head2
    } else if head2 == nil {
        return head1
    }
    
    var nodeAtOne = head1
    var nodeAtTwo = head2
    var newHead: ListNode? = nil
    var newTail: ListNode? = nil
    
    // 初始化新链表的head，以及最后一个结点
    if nodeAtOne!.value < nodeAtTwo!.value {
        newHead = nodeAtOne
        newTail = nodeAtOne
        nodeAtOne = nodeAtOne?.next
    } else {
        newHead = nodeAtTwo
        newTail = nodeAtTwo
        nodeAtTwo = nodeAtTwo?.next
    }
    
    // 遍历，比较nodeAtOne和nodeAtTwo值
    // newTail不断地指向较小的值
    while (nodeAtOne != nil && nodeAtTwo != nil) {
        if nodeAtOne!.value < nodeAtTwo!.value {
            newTail?.next = nodeAtOne
            newTail = nodeAtOne
            nodeAtOne = nodeAtOne?.next
        } else {
            newTail?.next = nodeAtTwo
            newTail = nodeAtTwo
            nodeAtTwo = nodeAtTwo?.next
        }
    }
    
    // 某一个链表先遍历完，newTail则指向另一个链表
    if nodeAtOne == nil {
        newTail?.next = nodeAtTwo
    } else {
        newTail?.next = nodeAtOne
    }
    
    return newHead;
}

func merge2(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
    if head1 == nil {
        return head2
    } else if head2 == nil {
        return head1
    }
    
    var newHead: ListNode? = nil
    
    if head1!.value < head2!.value {
        newHead = head1
        newHead?.next = merge1(head1?.next, head2)
    } else {
        newHead = head2
        newHead?.next = merge1(head1, head2?.next)
    }
    
    return newHead;
}

func printList(_ head: ListNode?) -> Void {
    var node = head
    
    while node != nil {
        print(node!.value)
        node = node?.next
    }
}

var node1_1 = ListNode(1)
var node1_2 = ListNode(3)
var node1_3 = ListNode(6)
var node1_4 = ListNode(9)
var node1_5 = ListNode(10)
node1_1.next = node1_2
node1_2.next = node1_3
node1_3.next = node1_4
node1_4.next = node1_5
node1_5.next = nil

var node2_1 = ListNode(2)
var node2_2 = ListNode(4)
var node2_3 = ListNode(5)
var node2_4 = ListNode(8)
var node2_5 = ListNode(9)
node2_1.next = node2_2
node2_2.next = node2_3
node2_3.next = node2_4
node2_4.next = node2_5
node2_5.next = nil

var newHead = merge2(node1_1, node2_1)

printList(newHead)
