//
//  92-ReverseBetween.swift
//  LinkedList
//
//  Created by Csy on 2019/2/13.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 说明:
 1 ≤ m ≤ n ≤ 链表长度。
 
 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
 
 思路一
    难点是最后生成的头结点和尾结点，都是不确定的
 */

import Foundation

class ReverseBetween {
    func solution1(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        // pre是在m前一个位置的结点，并且是固定不动
        // pre的next一直指向变换的头结点
        var pre: ListNode? = dummy
        for _ in 1..<m {
            pre = pre?.next
        }
        
        // node2一直指向最后一个结点
        let node1: ListNode? = pre?.next
        var node2: ListNode? = node1?.next
        for _ in 0..<(n - m) {
            // 反转链表
            node1?.next = node2?.next
            node2?.next = pre?.next
            pre?.next = node2
            node2 = node1?.next
        }
        return dummy.next
    }
}
