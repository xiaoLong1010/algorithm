//
//  61-RotateRight.swift
//  LinkedList
//
//  Created by Csy on 2019/1/23.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class RotateRight {
    func solution2(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        guard k > 0 else {
            return head
        }
        
        // 首先计算链表长度
        // lastNode指向最后一个结点
        var node = head
        var length = 1
        while node?.next != nil {
            length += 1
            node = node?.next
        }
        let lastNode = node
        
        // 链表尾部，最终需要旋转的结点的个数
        // 保证k不大于链表长度
        let k = k % length
        if k == 0 {
            return head
        }
        
        // 从头移动指针，让node指向倒数第k+1个指针
        node = head
        var count = 1
        while (count + k) < length {
            node = node?.next
            count += 1
        }
        
        // 移动指针
        let newHead = node?.next
        node?.next = nil
        lastNode?.next = head

        return newHead
    }
    
    func solution1(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        guard k > 0 else {
            return head
        }
        
        // 首先计算链表长度
        var node = head
        var length = 0
        while node != nil {
            length += 1
            node = node?.next
        }
        // 链表尾部，最终需要旋转的结点的个数
        // 保证k不大于链表长度
        let k = k % length
        if k == 0 {
            return head
        }
        
        // 创建虚拟头部
        let dummyHead = ListNode(0)
        dummyHead.next = head
        
        // 双指针，node2先走k步
        var node1: ListNode? = dummyHead
        var node2: ListNode? = dummyHead
        for _ in 1...k {
            node2 = node2?.next
        }
        
        // 在一起走到链表尾部
        // 此时node1指向要断开结点的前一个结点
        // node2指向最后一个结点
        while node2?.next != nil {
            node1 = node1?.next
            node2 = node2?.next
        }
        
        // 移动指针
        let newHead = node1?.next
        node1?.next = nil
        node2?.next = head
        dummyHead.next = nil
        
        return newHead
    }
}
