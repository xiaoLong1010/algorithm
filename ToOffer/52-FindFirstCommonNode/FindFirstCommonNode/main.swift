//
//  main.swift
//  FindFirstCommonNode
//
//  Created by Csy on 2018/11/20.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.value = val
        self.next = nil
    }
}

func length(_ head: ListNode?) -> Int {
    guard head != nil else {
        return 0
    }
    var length = 1
    var node = head
    
    while node?.next != nil {
        node = node?.next
        length += 1
    }
    return length
}

func firstCommonNode(_ head1: ListNode?, _ head2:ListNode?) -> ListNode? {
    guard head1 != nil && head2 != nil else {
        return nil
    }
    
    let length1 = length(head1)
    let length2 = length(head2)
    
    var nodeInLong = head1
    var nodeInShort = head2
    var diff = length1 - length2
    
    if length1 < length2 {
        nodeInLong = head2
        nodeInShort = head1
        diff = length2 - length1
    }
    
    // 长的先走
    for _ in 0..<diff {
        nodeInLong = nodeInLong?.next
    }
    
    // 再一起走
    while nodeInShort?.next != nil &&
        nodeInLong?.next != nil &&
        nodeInShort !== nodeInLong {
            
        nodeInShort = nodeInShort?.next
        nodeInLong = nodeInLong?.next
    }
    
    return nodeInShort
}

