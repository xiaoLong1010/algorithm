//
//  160-IntersectionNode.swift
//  LinkedList
//
//  Created by Csy on 2019/3/28.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 编写一个程序，找到两个单链表相交的起始节点。
 
 思路
    1 假设链表1和链表2
    2 链表1的长度 + 链表2相交之前长度 == 链表2的长度 + 链表1相交之前的长度
 */

import Foundation

class IntersectionNode {
    func getIntersectionNode(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
        if head1 == nil || head2 == nil {
            return nil
        }
        
        var node1 = head1
        var node2 = head2
        
        while node1 !== node2 {
            if node1 != nil {   // 一定要判断node，不能判断node.next.为了处理不相交的情况
                node1 = node1?.next
            }
            else {      // node1从链表2开始遍历
                node1 = head2
            }
            
            if node2 != nil {
                node2 = node2?.next
            }
            else {      // node2从链表1开始遍历
                node2 = head1
            }
        }
        
        return node1
    }
}
