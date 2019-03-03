//
//  206-ReverseList.swift
//  LinkedList
//
//  Created by Csy on 2019/3/3.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class ReverseList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var pre: ListNode? = nil
        var cur: ListNode? = head
        
        while cur != nil {
            // 先保留下一个结点的信息
            let post = cur?.next
            
            // 当前结点的next指针进行反转
            cur?.next = pre
            
            // 结点向右走一步
            pre = cur
            cur = post
        }
        return pre
    }
}
