//
//  2-AddTwoNumbers.swift
//  LinkedList
//
//  Created by Csy on 2019/2/13.
//  Copyright © 2019 CXL. All rights reserved.
//
/**
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 
 思路一
    模拟加法，需要一个进位的变量
 */
import Foundation

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        
        let newDummHead: ListNode? = ListNode(0)
        var tailNode = newDummHead
        var overNum = 0
        
        while node1 != nil || node2 != nil {
            // 加数1
            var num1 = 0
            if node1 != nil {
                num1 = node1!.val
            }
            
            // 加数2
            var num2 = 0
            if node2 != nil {
                num2 = node2!.val
            }
            
            // 求和，进位
            let sum = num1 + num2 + overNum
            overNum = sum / 10
            let num = sum % 10
            
            // 进行下一次计算
            tailNode?.next = ListNode(num)
            tailNode = tailNode?.next
            node1 = node1?.next
            node2 = node2?.next
        }
        if overNum > 0 {
            tailNode?.next = ListNode(overNum)
        }

        return newDummHead?.next
    }
}
