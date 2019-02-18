//
//  TreeNode.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/5.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

