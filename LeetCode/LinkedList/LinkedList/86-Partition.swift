//
//  86-Partition.swift
//  LinkedList
//
//  Created by Csy on 2019/2/13.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。
 
 你应当保留两个分区中每个节点的初始相对位置
 
 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5
 
 思路一
    建立两个链表，第一个链表的值全部小于x，第二个链表的值大于等于x，再将这两个链表头尾相连
 
 思路二
    找到第一个大于等于x的结点，在之后的遍历中，依次将小于x的结点放到前面。涉及到删除和插入，操作需要小心
 */

import Foundation

class Partition {
    func solution1(_ head: ListNode?, _ x: Int) -> ListNode? {
        // 小于x的链表
        let smalllHead = ListNode(0)
        var smallNode: ListNode? = smalllHead
        
        // 大于等于x的链表
        let bigHead = ListNode(0)
        var bigNode: ListNode? = bigHead
        
        // 遍历原链表，组成两个链表
        var node = head
        while node != nil {
            if node!.val < x {
                smallNode?.next = node
                smallNode = node
            } else {
                bigNode?.next = node
                bigNode = node
            }
            
            node = node?.next
        }
        
        // 将两个链表头尾相连
        smallNode?.next = bigHead.next     // smallNode指向最后一个结点，bigHead.next是第一个大于等于x的数字
        bigNode?.next = nil

        return smalllHead.next
    }
}
