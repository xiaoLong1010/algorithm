//
//  33-Search.swift
//  Array
//
//  Created by Csy on 2019/2/27.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 你可以假设数组中不存在重复的元素。
 你的算法时间复杂度必须是 O(log n) 级别。
 
 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 
 思路
    1 还是用二分查找
    2 但是两个区间，只有一个是有序的，需要进行判断，然后做不同的处理
 
 */

import Foundation

class Search {
    class Solution {
        func search(_ nums: [Int], _ target: Int) -> Int {
            var left = 0
            var right = nums.count - 1
            var mid = 0
            
            while left <= right {
                mid = left +  (right - left) >> 1
                
                if nums[mid] == target {
                    return mid
                }
                
                if nums[mid] >= nums[left] {
                    // 左边有序，并且target在左边区间
                    if nums[mid] > target && target >= nums[left] {
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                } else {
                    // 右边有序，并且target在右边区间
                    if nums[mid] < target && target <= nums[right] {
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                }
            }
            return -1
        }
    }
    
    func search2(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        return search(0, nums.count - 1, nums, target) ?? -1
    }
    
    func search(_ start: Int, _ end: Int, _ nums: [Int], _ target: Int) -> Int? {
        
        if (start == end) {
            if nums[start] == target {
                return start
            } else {
                return nil
            }
        }
        
        let mid = (start + end) / 2
        
        //if start to mid is sorted
        if nums[start] <= nums[mid]  {
            if target >= nums[start] && target <= nums[mid] {
                return search(start, mid, nums, target)
            } else {
                return search(mid + 1, end, nums, target)
            }
            
        }
        
        //if mid to end is sorted
        if target >= nums[mid + 1] && target <= nums[end] {
            return search(mid + 1, end, nums, target)
        } else {
            return search(start, mid, nums, target)
        }
    }
    
}
