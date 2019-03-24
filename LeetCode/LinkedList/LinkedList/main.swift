//
//  main.swift
//  LinkedList
//
//  Created by Csy on 2019/1/23.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

var node1 = ListNode(1)
var node2 = ListNode(2)
var node3 = ListNode(3)
var node4 = ListNode(4)
var node5 = ListNode(5)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node4.next = nil

let answer = ReverseBetween()
answer.solution1(node1, 1, 3)
