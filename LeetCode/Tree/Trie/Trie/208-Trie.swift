//
//  208-Trie.swift
//  Trie
//
//  Created by Csy on 2019/4/6.
//  Copyright © 2019 ChenLong. All rights reserved.
//

import Foundation

class Trie208 {
    private var root: TrieNode<Character>
    
    /** Initialize your data structure here. */
    init() {
        self.root = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
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
        var currentNode = root
        for character in word.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return false
            }
            currentNode = childNode
        }
        return currentNode.isTerminating
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        guard !prefix.isEmpty else {
            return false
        }
        var currentNode = root
        for character in prefix.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return false
            }
            currentNode = childNode
        }
        return true
    }
}
