//
//  23-MergeKLists.swift
//  StackQueue
//
//  Created by Csy on 2019/2/14.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 输入:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 
 输出: 1->1->2->3->4->4->5->6
 
 思路一
    1 使用优先队列
    2 首先将每个链表的头结点入队，这些头结点就是有序的
    3 出队，如果该结点还有下一个结点，那就将这个结点加入到优先队列中，优先队列还是有序的。
    4 重复步骤3，直到优先队列为空
 思路二
    1 将所有的结点加入到数组
    2 直接调用数组的排序方法，传入一个排序的闭包参数
    3 再将这些结点链接起来
 */

import Foundation

private func < (f1: ListNode, f2: ListNode) -> Bool {
    return f1.val < f2.val
}

class MergeKLists {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let count = lists.count
        if count == 0 {
            return nil
        }
        
        var queue = PriorityQueue<ListNode>(sort: <)
        
        // 首先将每个链表的头结点入队，就是有序的了
        for head in lists {
            if head != nil {
                queue.enqueue(head!)
            }
        }
        
        // 先初始化头结点
        var newHead: ListNode? = nil
        newHead = queue.dequeue()
        if newHead?.next != nil {
            queue.enqueue((newHead?.next)!)
        }
        
        // 再依次出队
        var tail = newHead
        while !queue.isEmpty {
            let node = queue.dequeue()
            tail?.next = node
            tail = node
            
            if node?.next != nil {
                queue.enqueue((node?.next)!)
            }
        }
        
        return newHead
    }
    
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
        let count = lists.count
        if count == 0 {
            return nil
        }
        
        var nodes = [ListNode]()
        
        // 将所有的node放入数组
        for var node in lists {
            while node != nil {
                nodes.append(node!)
                node = node?.next
            }
        }
        let length = nodes.count
        if length == 0 {
            return nil
        }
        
        // 排序
        nodes.sort { (node1, node2) -> Bool in
            return node1.val < node2.val
        }
        
        // 将node连接起来
        var i = 0
        while i < length-1 {
            let node1 = nodes[i]
            let node2 = nodes[i+1]
            node1.next = node2
            i += 1
        }
        nodes[length-1].next = nil
        
        return nodes[0]
    }
}

