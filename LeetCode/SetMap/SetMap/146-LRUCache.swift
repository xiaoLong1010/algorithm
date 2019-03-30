//
//  146-LRUCache.swift
//  SetMap
//
//  Created by Csy on 2019/3/30.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class LRUNode {
    public var value: Int
    public var key: Int
    public var pre: LRUNode?
    public var next: LRUNode?
    
    init(_ key: Int, _ num: Int) {
        self.key = key
        self.value = num
    }
}

class LRUCache {
    private let capacity: Int
    private var map: Dictionary<Int, LRUNode>
    private var head: LRUNode?
    private var tail: LRUNode?
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.map = Dictionary<Int, LRUNode>()
    }
    
    func get(_ key: Int) -> Int {
        if let node = self.map[key] {
            self.bringNodeToFront(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = self.map[key] {
            node.value = value
            self.bringNodeToFront(node)
        } else {
            self.insertNodeToFront(key, value)
        }
    }
    
    private func bringNodeToFront(_ node: LRUNode) -> Void {
        // 已经是头结点
        if node.pre == nil {
            return
        }
        
        // 获取当前结点的前后结点
        let preNode = node.pre
        let nextNode = node.next
        
        // 将当前结点从链表从移除
        preNode?.next = nextNode
        nextNode?.pre = preNode
        if self.tail === node {
            self.tail = preNode
        }
        
        // 将当前结点插入到头部
        self.head?.pre = node
        node.next = head
        node.pre = nil
        
        self.head = node
    }
    
    private func insertNodeToFront(_ key: Int, _ value: Int) -> Void {
        // 超过容量，删除一个结点
        if self.map.count >= self.capacity {
            self.map.removeValue(forKey: self.tail!.key)
            self.tail = tail?.pre
            self.tail?.next = nil
        }
        
        // 保存到字典
        let node: LRUNode? = LRUNode(key, value)
        self.map[key] = node
        
        // 插入到头部
        if self.head != nil {
            self.head?.pre = node
            node?.next = head
            self.head = node
        }
        else {
            self.head = node
            self.tail = node
        }
    }
}
