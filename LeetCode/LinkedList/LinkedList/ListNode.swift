//
//  ListNode.swift
//  LinkedList
//
//  Created by Csy on 2019/1/23.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
