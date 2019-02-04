//
//  83-DeleteDuplicates.swift
//  LinkedList
//
//  Created by Csy on 2019/2/4.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class DeleteDuplicates {
    func solution(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return head
        }
        
        // 每次node2找到下一个结点，node1的next就指向node2
        var node1 = head
        var node2 = head?.next
        
        while node2 != nil {
            // node2指向下一个不同的值
            while node2 != nil && node2!.val == node1!.val {
                node2 = node2?.next
            }
            
            // node1
            node1?.next = node2
            
            node1 = node2
            node2 = node2?.next
        }
        
        node1?.next = node2
        
        return head
    }
}
