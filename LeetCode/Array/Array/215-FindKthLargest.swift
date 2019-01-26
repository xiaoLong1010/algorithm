//
//  215-FindKthLargest.swift
//  Array
//
//  Created by Csy on 2019/1/25.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 
 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 
 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 输出: 4
 */

import Foundation

class FindKthLargest {
    // 使用快排算法，从大到小排序
    func solution1(_ nums: [Int], _ k: Int) -> Int {
        let length = nums.count
        var nums = nums
        
        // 先进行一次排序，看是否能够找到
        var index = self.partition(&nums, 0, length-1)
        let target = k - 1
        
        // 不断进行快排，找到正确的数字
        while index != target {
            if index > target {
                index = self.partition2(&nums, 0, index-1)
            } else {
                index = self.partition2(&nums, index+1, length - 1)
            }
        }
        return nums[index]
    }
    
    func solution2(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted(by: >)
        return nums[k-1]
    }
    
    func partition(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
        var left = low
        var right = high

        //随机选， 对于近似排序的数组，防止时间复杂度退化
        let randonIndex = Int.random(in: 0...high-low) + low
        (nums[randonIndex],nums[right]) = (nums[right],nums[randonIndex])
        let middleData = nums[right]
        
        // 双指针，对于重复元素很多的数据，防止时间复杂度退化
        while left < right {
            // 找出左边，小于middleData的数字，然后将其放到右边
            while left < right && nums[left] > middleData {
                left += 1
            }
            nums[right] = nums[left]
            
            // 找出右边，大于middleData的数字，然后将其放到左边
            while left < right && nums[right] <= middleData {
                right -= 1
            }
            nums[left] = nums[right]
        }
        
        // 将middleData放到中间位置
        nums[left] = middleData
        
        return left
    }
    
/**
     swap( arr[l] , arr[rand()%(r-l+1)+l] );
     T v = arr[l];
     
     int i = l+1, j = r;
     while( true ){
     while( i <= r && arr[i] < v )
     i ++;
     
     while( j >= l+1 && arr[j] > v )
     j --;
     
     if( i > j )
     break;
     
     swap( arr[i] , arr[j] );
     i ++;
     j --;
     }
     
     swap( arr[l] , arr[j]);
     
     return j;
     
*/
    // 在leetcode中，partition2可以通过。partition不可以通过
    func partition2(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
        //随机选， 对于近似排序的数组，防止时间复杂度退化
        let randonIndex = Int.random(in: 0...high-low) + low
        (nums[randonIndex], nums[low]) = (nums[low], nums[randonIndex])
        let middleData = nums[low]
        
        // 双指针，对于重复元素很多的数据，防止时间复杂度退化
        var left = low+1
        var right = high
        while true {
            // 找出左边，小于middleData的数字，然后将其放到右边
            while left <= right && nums[left] > middleData {
                left += 1
            }
            
            // 找出右边，大于middleData的数字，然后将其放到左边
            while right >= left+1 && nums[right] < middleData {
                right -= 1
            }
            
            if left > right {
                break
            }
            
            (nums[left], nums[right]) = (nums[right], nums[left])
            left += 1
            right -= 1
        }
        
        // 将middleData放到中间位置
        (nums[low], nums[right]) = (nums[right], nums[low])
        
        return right
    }
}
