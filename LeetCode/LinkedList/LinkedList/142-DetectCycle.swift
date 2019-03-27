//
//  142-DetectCycle.swift
//  LinkedList
//
//  Created by Csy on 2019/3/27.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
 
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 
 说明：不允许修改给定的链表。
 
 思路
    1 首先通过快慢指针，找到环中的一个结点
    2 然后环中的结点遍历，和环外的结点进行比较，如果找到相等的，就是入口
    或者
 https://cloud.tencent.com/developer/article/1381295
 https://www.cnblogs.com/ganganloveu/p/3715981.html
 */

import Foundation

class DetectCycle {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        // 判断是否有环
        var cycleNode = self.nodeInCycle(head)
        if cycleNode == nil {
            return nil
        }
        
        //  计算公式，见连接
        var node1 = head
        while node1 !== cycleNode {
            node1 = node1?.next
            cycleNode = cycleNode?.next
        }
        
        return cycleNode
    }
    
    func detectCycle2(_ head: ListNode?) -> ListNode? {
        
        // 判断是否有环
        let cycleNode = self.nodeInCycle(head)
        if cycleNode == nil {
            return nil
        }
        
        var node1 = head        // 在环外遍历
        var node2 = cycleNode   // 在环内遍历
        
        while node1 !== node2 {
            // 圆环内遍历，和node1进行比较
            node2 = cycleNode?.next
            while node2 !== cycleNode {
                if node1 === node2 {
                    return node1
                }
                node2 = node2?.next
            }
            
            node1 = node1?.next
        }
        
        return node1
    }
    
    func nodeInCycle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return nil
        }
        
        // 快慢指针
        // node1在后，每次走1步；node2在前，每次走2步
        var node1 = head
        var node2 = head
        while node2?.next != nil {
            node1 = node1?.next
            node2 = node2?.next?.next
            
            if node1 === node2 {
                return node1
            }
        }
        
        return nil
    }
}
