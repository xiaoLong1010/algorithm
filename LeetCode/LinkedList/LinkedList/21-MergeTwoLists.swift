//
//  21-MergeTwoLists.swift
//  LinkedList
//
//  Created by Csy on 2019/2/13.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 
 思路一
    使用虚拟头结点，用两个指针同时遍历两个指针
 */

import Foundation

class MergeTwoLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        }
        
        let dummyHead = ListNode(-1)
        var tail: ListNode? = dummyHead    // 新链表的最后一个结点
        
        var node1 = l1
        var node2 = l2
        
        while node1 != nil && node2 != nil {
            if node1!.val < node2!.val {
                tail?.next = node1
                tail = node1
                node1 = node1?.next
            } else {
                tail?.next = node2
                tail = node2
                node2 = node2?.next
            }
        }
        
        if node1 == nil {
            tail?.next = node2
        } else if node2 == nil {
            tail?.next = node1
        }
        
        return dummyHead.next
    }
}
