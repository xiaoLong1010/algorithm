//
//  148-SortList.swift
//  LinkedList
//
//  Created by Csy on 2019/2/13.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 
 思路一
    1 归并排序
    2 自底向上
 */
/**
 * 参考：Sort List——经典（链表中的归并排序） https://www.cnblogs.com/qiaozhoulin/p/4585401.html
 *
 * 归并排序法：在动手之前一直觉得空间复杂度为常量不太可能，因为原来使用归并时，都是 O(N)的，
 * 需要复制出相等的空间来进行赋值归并。对于链表，实际上是可以实现常数空间占用的（链表的归并
 * 排序不需要额外的空间）。利用归并的思想，递归地将当前链表分为两段，然后merge，分两段的方
 * 法是使用 fast-slow 法，用两个指针，一个每次走两步，一个走一步，知道快的走到了末尾，然后
 * 慢的所在位置就是中间位置，这样就分成了两段。merge时，把两段头部节点值比较，用一个 p 指向
 * 较小的，且记录第一个节点，然后 两段的头一步一步向后走，p也一直向后走，总是指向较小节点，
 * 直至其中一个头为NULL，处理剩下的元素。最后返回记录的头即可。
 *
 * 主要考察3个知识点，
 * 知识点1：归并排序的整体思想
 * 知识点2：找到一个链表的中间节点的方法
 * 知识点3：合并两个已排好序的链表为一个新的有序链表
 */

import Foundation

class SortList {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        return self.mergeSort(head)
    }
    
    func mergeSort(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        
        // 通过双指针，找到中间结点
        // node1在后，每次走1步；node2在前，每次走两步
        // 最后node1停在中间结点
        let dummyHead: ListNode? = ListNode(-1)
        dummyHead?.next = head
        var node1 = dummyHead
        var node2 = dummyHead
        while node2?.next != nil {
            node1 = node1?.next
            node2 = node2?.next?.next
        }
        let secondHead = node1?.next    // 第二段的起点
        node1?.next = nil
        
        let left = self.mergeSort(head)         // 第一段进行排序
        let right = self.mergeSort(secondHead)  // 第二段进行排序
        
        return self.mergeTwoLists(left, right)  // 合并两个有序链表
    }
    
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
