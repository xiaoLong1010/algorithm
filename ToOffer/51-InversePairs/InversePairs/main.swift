//
//  main.swift
//  InversePairs
//
//  Created by Csy on 2018/11/27.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func merge(_ nums: inout Array<Int>, start: Int, middle: Int, end: Int) -> Int {
    var temps = Array<Int>()
    
    // temps将会被分成左右两个数组
    for index in start...end {
        temps.append(nums[index])
    }
    
    // 左边数组
    var leftIndex = 0      // 左边数组的索引
    let leftMaxIndex = middle - start  // 左边数组最大索引
    
    // 右边数组
    var rightIndex = leftMaxIndex + 1   // 右边数组索引
    let rightMaxIndex = end - start  // 右边数组数组最大索引
    
    // nums数组的索引
    var index = start

    // 数量
    var count = 0
    
    // 比较左右两个数组
    while (leftIndex <= leftMaxIndex) && (rightIndex <= rightMaxIndex) {
        let leftValue = temps[leftIndex]
        let rightValue = temps[rightIndex]
        
        // nums数组取较小的值
        if leftValue > rightValue {
            nums[index] = rightValue
            count += leftMaxIndex - leftIndex + 1   // 左边剩余的每个数，都和temps[rightIndex]，组成逆序对
            rightIndex += 1
            index += 1
        } else {
            nums[index] = leftValue
            leftIndex += 1
            index += 1
        }
    }
    
    // 左边数组，复制到nums
    while (leftIndex <= leftMaxIndex) {
        nums[index] = temps[leftIndex]
        leftIndex += 1
        index += 1
    }
    // 右边数组，复制到nums
    while (rightIndex <= rightMaxIndex) {
        nums[index] = temps[rightIndex]
        rightIndex += 1
        index += 1
    }

    return count
}

func countSort(_ nums: inout Array<Int>, start: Int, end: Int) -> Int {
    if start >= end {
        return 0
    }
    
    let middle = (start + end) >> 1
    let leftCount = countSort(&nums, start: start, end: middle)
    let rightCount = countSort(&nums, start: middle + 1, end: end)
    let count = merge(&nums, start: start, middle: middle, end: end)
    
    return leftCount + rightCount + count
}

var nums1 = [7,5,6,4]
var count = countSort(&nums1, start: 0, end: nums1.count - 1)
print(count)

var nums2 = [5,6,7,8,1,2,3,4]
count = countSort(&nums2, start: 0, end: nums2.count - 1)
print(count)


