//
//  307-NumArray.swift
//  SegmentTree
//
//  Created by Csy on 2019/4/6.
//  Copyright © 2019 ChenLong. All rights reserved.
//

import Foundation

class NumArray2 {
    
    private var root: SegmentTree<Int>?
    
    init(_ nums: [Int]) {
        if nums.count > 0 {
            self.root = SegmentTree<Int>(array: nums,function: +)
        }
    }
    
    func update(_ i: Int, _ val: Int) {
        if self.root == nil {
            return
        }
        
        self.root!.replaceItem(at: i, withItem: val)
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if self.root == nil {
            return 0
        }
        return self.root!.query(leftBound: i, rightBound: j)
    }
}

