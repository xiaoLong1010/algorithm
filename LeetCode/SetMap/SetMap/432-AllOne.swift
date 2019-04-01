//
//  432-AllOne.swift
//  SetMap
//
//  Created by Csy on 2019/3/31.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class AllOneNode {
    public final var count: Int
    public var keys: Set<String>
    public var pre: AllOneNode?
    public var next: AllOneNode?
    
    init( _ count: Int) {
        self.keys = Set<String>()
        self.count = count
    }
    
    public func addKey(_ key: String) -> Void {
        self.keys.insert(key)
    }
    
    public func removeKey(_ key: String) -> Void {
        self.keys.remove(key)
    }
}

class AllOne {
    var map: Dictionary<String, AllOneNode>
//    var firstNode: AllOneNode
    
    var head: AllOneNode?
    var tail: AllOneNode?

    /** Initialize your data structure here. */
    init() {
        self.map = Dictionary<String, AllOneNode>()
//        firstNode = AllOneNode(1)
    }
    
    /** Inserts a new key <Key> with value 1. Or increments an existing key by 1. */
    func inc(_ key: String) {
        // 如果key不存在，就要加入count为
        if self.map[key] == nil {
            // count等于1的结点存在
            if self.head != nil && self.head!.count == 1 {
                self.head?.addKey(key)
                self.map[key] = self.head!
            }
            else {
                // 创建count为1的结点
                let node = AllOneNode(1)
                node.addKey(key)
                
                // 将node加入到map
                self.map[key] = node
                
                // 将node加入到链表
                if self.head == nil {
                    self.head = node
                    self.tail = node
                }
                else {
                    node.next = self.head
                    self.head?.pre = node
                    self.head = node
                }
            }
            return
        }
        
        // key已经存在，先把key从当前结点把删除，准备将key放到下一个结点
        let node = self.map[key]!
        node.removeKey(key)
        
        let preNode = node.pre
        let nextNode = node.next
        
        // 不是最后一个结点，就将key移动到它后一个结点
        if self.tail !== node {
            // 当前结点的key set空了，就移除当前结点
            if node.keys.isEmpty {
                // 先从map删除
                self.map.removeValue(forKey: key)
                
                // 再从链表删除
                if node !== self.head {
                    preNode?.next = nextNode
                    nextNode?.pre = preNode
                } else {
                    self.head = nextNode   // 如果node是头结点，head指向下一个结点
                    self.head?.pre = nil
                }
            }
            
            // 将key添加到下一个结点
            nextNode?.addKey(key)
            self.map[key] = nextNode!
        }
        else {      // 如果是最后一个结点,需要新增一个结点
            // 移除当前结点
            if node.keys.isEmpty {
                self.map.removeValue(forKey: key)
                if node !== self.head {
                    self.tail = preNode!
                    self.tail?.next = nil
                } else {
                    self.tail = nil
                    self.head = nil
                }
            }
            
            // 新增一个结点，保存到map
            let newNode = AllOneNode(node.count + 1)
            newNode.addKey(key)
            self.map[key] = newNode
            
            // 保存到链表
            if self.head == nil {
                self.head = newNode
                self.tail = newNode
            }
            else {
                self.tail?.next = newNode
                newNode.pre = self.tail
                self.tail = newNode
            }
        }
    }
    
    /** Decrements an existing key by 1. If Key's value is 1, remove it from the data structure. */
    func dec(_ key: String) {
        if self.map[key] == nil {
            return
        }
        
        let node = self.map[key]!
        // key先从node的key set移除
        // 如果该node的key set不为空，只需要把key从map删除
        node.removeKey(key)
        self.map.removeValue(forKey: key)
        
        let preNode = node.pre
        let nextNode = node.next
        
        // 找到前一个结点，将key添加进去
        if self.head === node {
            // 如果node为空了，要先移除
            if node.keys.isEmpty {
                // 从map移除
                self.map.removeValue(forKey: key)
                
                // 从链表移除
                if self.tail !== node {
                    self.head = nextNode
                    self.head?.pre = nil
                } else {
                    self.head = nil
                    self.tail = nil
                }
            }
            
            // 将key添加到前一个结点
            if node.count > 1 {
                // 新增一个结点，保存到map
                let newNode = AllOneNode(node.count - 1)
                newNode.addKey(key)
                self.map[key] = newNode
                
                // 保存到链表
                if self.head == nil {
                    self.head = newNode
                    self.tail = newNode
                }
                else {
                    self.head?.pre = newNode
                    newNode.next = self.head
                    self.head = newNode
                }
            }
        }
        else {
            // 如果node为空了，要先移除
            if node.keys.isEmpty {
                // 从map移除
                self.map.removeValue(forKey: key)
                
                // 从链表移除
                if self.tail !== node {
                    preNode?.next = nextNode
                    nextNode?.pre = preNode
                } else {    // 尾结点
                    self.tail = preNode
                    self.tail?.next = nil
                }
            }
            
            // 将key添加到前一个结点
            if node.count == preNode!.count+1 {
                // 只需要保存到map
                self.map[key] = preNode
                preNode?.addKey(key)
            }
            else {
                // 新增一个结点，保存到map
                let newNode = AllOneNode(node.count - 1)
                newNode.addKey(key)
                self.map[key] = newNode
                
                // 插入到链表
                preNode?.next = newNode
                newNode.pre = preNode
                
                newNode.next = nextNode
                nextNode?.pre = newNode
                
                // 表明nextNode是nil
                if self.tail === preNode {
                    self.tail = newNode
                }
            }
        }
    }
    
    /** Returns one of the keys with maximal value. */
    func getMaxKey() -> String {
        if self.tail != nil {
            return self.tail!.keys.randomElement()!
        }
        return ""
    }
    
    /** Returns one of the keys with Minimal value. */
    func getMinKey() -> String {
        if self.head != nil {
            return self.head!.keys.randomElement()!
        }
        return ""
    }
}
