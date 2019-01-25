//
//  88-Merge.swift
//  Array
//
//  Created by Csy on 2019/1/25.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class Merge {
    func solution1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        // 将nums1的m个数字放到辅助数组aux
        var aux = [Int]()
        aux.append(contentsOf: nums1[0..<m])
        
        // 初始化两个下标
        var index1 = 0  // aux的下标
        var index2 = 0  // nums2的下标
        
        // 遍历aux和nums2的两个数组，将数字放到nums1中
        for i in 0...(m+n-1) {
            if index1 >= m {        // aux已经遍历完，将num2的数据放到nums1
                nums1[i] = nums2[index2]
                index2 += 1
            }
            else if index2 >= n {   // nums2已经遍历完，将aux的数据放到nums1
                nums1[i] = aux[index1]
                index1 += 1
            }
            else if aux[index1] > nums2[index2] {   // nums2的数据较小，就把数据放到nums1
                nums1[i] = nums2[index2]
                index2 += 1
            }
            else {
                nums1[i] = aux[index1]
                index1 += 1
            }
        }
    }
}
