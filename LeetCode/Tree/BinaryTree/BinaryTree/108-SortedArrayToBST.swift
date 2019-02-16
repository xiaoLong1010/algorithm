//
//  108-SortedArrayToBST.swift
//  BinaryTree
//
//  Created by Csy on 2019/2/16.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class SortedArrayToBST {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        let count = nums.count
        if nums.count == 0 {
            return nil
        }
        
        return self.sortedArrayToBST(nums, 0, count-1)
    }
    
    func sortedArrayToBST(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        
        // 先创建root，取数组中间的元素。为了保持平衡性
        let  middle = start + (end - start) >> 1
        let root = TreeNode(nums[middle])
        
        root.left = self.sortedArrayToBST(nums, start, middle-1)
        root.right = self.sortedArrayToBST(nums, middle+1, end)
        
        return root
    }
}
