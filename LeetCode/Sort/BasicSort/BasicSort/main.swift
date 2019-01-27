//
//  main.swift
//  BasicSort
//
//  Created by Csy on 2018/12/10.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func selectSort(_ nums: inout Array<Int>) -> Void {
    let length = nums.count
    
    // 找到从i下标开始到数组末尾，最小值的坐标
    for i in 0..<length-1 {
        var minIndex = i
        for j in i+1..<length {
            if nums[minIndex] > nums[j] {
                minIndex = j
            }
        }
        
        // 找到minIndex，那就要把最小值交换到i所在位置
        if minIndex != i {
            let temp = nums[i]
            nums[i] = nums[minIndex]
            nums[minIndex] = temp
        }
    }
}

func heapSort(_ nums: inout Array<Int>) -> Void{
    let length = nums.count
    
    // 将数组初始化为大顶堆
    for index in (0...(length / 2 - 1)).reversed() {
        adjustHeap(&nums, subRootIndex: index, length: length)
    }
    
    //
    for index in (1...(length - 1)).reversed() {
        swap(&nums, 0, index)   // 交换之后，index下标的value就是最大值了，就不用参与比较了
        adjustHeap(&nums, subRootIndex: 0, length: index)
    }
}

func swap(_ nums: inout Array<Int>, _ i: Int, _ j: Int) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

// 调整以subRootIndex为root的子树，为大顶堆
func adjustHeap(_ nums: inout Array<Int>, subRootIndex: Int, length: Int) -> Void {
    
    let initRootValue = nums[subRootIndex]
    var targetIndex = subRootIndex
    
    // 保证至少有左子节点
    while 2 * targetIndex + 1 < length {
        // left = 2 * root + 1,表示root的左子节点下标
        let leftIndex = 2 * targetIndex + 1
        let leftValue = nums[leftIndex]
        
        // 左 右子节点的最大值
        var biggerIndex = leftIndex
        var biggerValue = nums[biggerIndex]
        if leftIndex + 1 < length {
            let rightIndex = leftIndex + 1
            let rightValue = nums[rightIndex]
            biggerIndex = leftValue > rightValue ? leftIndex : rightIndex
            biggerValue = nums[biggerIndex]
        }
        
        // 初始的initRootValue如果是最大值，就结束
        if initRootValue >= biggerValue {
            break
        }
        
        nums[targetIndex] = biggerValue
        
        // 从下面开始找
        targetIndex = biggerIndex
    }
    nums[targetIndex] = initRootValue
}

//左边是有序的，取右边第一个num，在左边找到合适的位置
//在找的时候，需要一个一个地复制左边有序数列，到右边
func insertSort(_ nums: inout Array<Int>) -> Void {
    let length = nums.count
    
    for i in 1..<length {
        // 0到i-1，都是有序的；现在把nums[i]放到合适位置
        let temp = nums[i]
        var j = i
        
        // 从左边有序数列，找到小于nums[i]的数
        // 找不到，就一个一个地,向右边复制数字
        while (j > 0) && (nums[j-1] > temp) {
            nums[j] = nums[j-1];
            j -= 1
        }
        nums[j] = temp     // 将temp放到合适位置
    }
}

func shellSort(_ nums: inout Array<Int>) -> Void {
    let length = nums.count
    
    var d = length >> 2     // 间隔
    while d > 0 {
        for i in d..<length {
            // 前面都是有序的；现在把nums[i]放到合适位置
            let temp = nums[i]
            var j = i
            
            // 从左边有序数列，找到小于nums[i]的数
            // 找不到，就一个一个地,向右边复制数字
            while (j-d >= 0) && (nums[j-d] > temp) {
                nums[j] = nums[j-d];
                j -= d
            }
            nums[j] = temp     // 将temp放到合适位置
        }
        d = d >> 2
    }
}

func bubbleSort(_ nums: inout Array<Int>) -> Void {
    let length = nums.count
    
    for i in 0..<length-1 {     // 执行的次数
        var hasExchange = false
        for j in 0..<length-1-i {       // 0到j+1就是需要冒泡比较的序列
            // 左边大于右边，就需要交换
            if nums[j] > nums[j+1] {
                let temp = nums[j]
                nums[j] = nums[j+1]
                nums[j+1] = temp
                hasExchange = true
            }
        }
        // 如果没有进行交换了，就说明已经有序了
        if !hasExchange {
            return
        }
    }
}

func bubbleSort2(_ nums: inout Array<Int>) -> Void {
    let length = nums.count
    
    // 从最大索引到最小索引方向进行冒泡
    for i in 0..<length-1 {     // i表示最终冒泡结果要放的位置
        var hasExchange = false
        for j in (i+1...length-1).reversed() {       // 需要冒泡比较的序列
            // 右边小于左边，就需要交换
            if nums[j] < nums[j-1] {
                let temp = nums[j]
                nums[j] = nums[j-1]
                nums[j-1] = temp
                
                hasExchange = true
            }
        }
        // 如果没有进行交换了，就说明已经有序了
        if !hasExchange {
            return
        }
    }
}

func quickSort(_ nums: inout Array<Int>) -> Void {
    _quickSort(&nums, start: 0, end: nums.count-1)
}

func _quickSort(_ nums: inout Array<Int>, start: Int, end: Int) -> Void {
    if start >= end {
        return
    }
    
    let index = _partion(&nums, start: start, end: end)
    _quickSort(&nums, start: start, end: index-1)
    _quickSort(&nums, start: index+1, end: end)
}

func _partion(_ nums: inout Array<Int>, start: Int, end: Int) -> Int {
    var left = start
    var right = end
    
    //随机选， 对于近似排序的数组，防止时间复杂度退化
    let randonIndex = Int.random(in: 0...right-left) + start
    (nums[randonIndex],nums[right]) = (nums[right],nums[randonIndex])
    let middleValue = nums[right]
    
    // 双指针，对于重复元素很多的数据，防止时间复杂度退化
    while left < right {
        // 找到较大的数，放到右边
        while (left < right) && nums[left] < middleValue {
            left += 1
        }
        nums[right] = nums[left]
        
        // 找到较小的数，放到左边
        while (left < right) && nums[right] >= middleValue {
            right -= 1
        }
        nums[left] = nums[right]
    }
    nums[right] = middleValue
    
    return right
}

func mergeSort(_ nums: inout Array<Int>, low: Int, high: Int) -> Void {
    if low >= high {
        return
    }
    
    // 如果需要排序的区间比较小，那很有可能该区间是近似有序的，此时可以用插入排序
//    if high - low >= 15 {
//        insertSort(&nums)
//        return
//    }
    
    let middle = low + (high - low) / 2
    mergeSort(&nums, low: low, high: middle)
    mergeSort(&nums, low: middle+1, high: high)
    
    // 小优化
    if nums[middle] > nums[middle + 1] {
        merge2(&nums, low: low, middle: middle, high: high)
    }
    
}

// 自底向上
func mergeSort2(_ nums: inout Array<Int>) -> Void {
    let length = nums.count
    
    // size表示区间的大小，每次要合并两个区间
    var size = 1
    while size <= length {
        
        var i = 0
        while i < length - size {
            // 对[i, i+sz-1] 和[i+sz, i+2*sz-1]进行合并
            
            if nums[i+size-1] > nums[i+size] {
                merge2(&nums, low: i, middle: i+size-1, high: min(i+2*size-1, length-1))
            }
            i += (size + size)
        }
        
        size += size
    }
}

func merge(_ nums: inout Array<Int>, low: Int, middle: Int, high: Int) -> Void {
    if low == high  {
        return
    }
    
    var left = low
    var right = middle + 1
    let length = high - low + 1
    var sortedList = Array<Int>()
    
    while left <= middle && right <= high {
        let leftValue = nums[left]
        let rightValue = nums[right]
        
        if leftValue < rightValue {
            sortedList.append(leftValue)
            left += 1
        } else {
            sortedList.append(rightValue)
            right += 1
        }
    }
    
    // 没有比较完的左子数组，放到sortedList
    while left <= middle {
        sortedList.append(nums[left])
        left += 1
    }
    
    // 没有比较完的右子数组，放到sortedList
    while right <= high {
        sortedList.append(nums[right])
        right += 1
    }
    
    for index in 0..<length {
        nums[index + low] = sortedList[index]
    }
}

func merge2(_ nums: inout Array<Int>, low: Int, middle: Int, high: Int) -> Void {
    if low == high  {
        return
    }
    
    var left = low
    var right = middle + 1
    
    // 辅助数组
    var aux = Array<Int>()
    for index in low...high {
        aux.append(nums[index])
    }
    
    for index in low...high {
        if left > middle {      // 左边处理完了，把右边放入数组中
            nums[index] = aux[right - low]
            right += 1
        }
        else if right > high {  // 右边处理完了，把左边放入数组中
            nums[index] = aux[left - low]
            left += 1
        }
        else if aux[left - low] < aux[right - low] {    // 左边较小，把左边放到数组
            nums[index] = aux[left - low]
            left += 1
        } else {
            nums[index] = aux[right - low]
            right += 1
        }
    }
}

var nums = [23,1,3,12,2,8,4]
quickSort(&nums)
//mergeSort(&nums, low: 0, high: nums.count-1)
//nums = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
//heapSort(&nums)
print(nums)
