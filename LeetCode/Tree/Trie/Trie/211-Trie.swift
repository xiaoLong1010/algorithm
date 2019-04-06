//
//  211-Trie.swift
//  Trie
//
//  Created by Csy on 2019/4/6.
//  Copyright © 2019 ChenLong. All rights reserved.
//

import Foundation

class Trie211 {
    private var root: TrieNode<Character>
    
    /** Initialize your data structure here. */
    init() {
        self.root = TrieNode()
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        guard !word.isEmpty else {
            return
        }
        
        var currentNode = root
        for character in word.lowercased() {
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                currentNode.add(value: character)
                currentNode = currentNode.children[character]!
            }
        }
        
        // Word already present?
        guard !currentNode.isTerminating else {
            return
        }
        currentNode.isTerminating = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        guard !word.isEmpty else {
            return false
        }
        
        return self.match(self.root, Array(word), 0)
    }
    
    // 从node开始的trie树开始匹配，不算node。匹配的字符串，从index开始
    func match(_ node: TrieNode<Character>, _ chars: [Character], _ index: Int) -> Bool {
        if index == chars.count {
            return node.isTerminating
        }
        
        let c = chars[index]
        
        if c != "." {
            if let nextNode = node.children[c] {
                return self.match(nextNode, chars, index+1)
            }
            else {
                return false
            }
        }
        else {
            for nextNode in node.children.values {
                if self.match(nextNode, chars, index+1) {
                    return true
                }
            }
            return false
        }
    }
}

