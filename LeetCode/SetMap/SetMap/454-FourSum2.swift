//
//  454-FourSum2.swift
//  SetMap
//
//  Created by Csy on 2019/2/1.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定四个包含整数的数组列表 A , B , C , D ,计算有多少个元组 (i, j, k, l) ，使得 A[i] + B[j] + C[k] + D[l] = 0。
 
 为了使问题简单化，所有的 A, B, C, D 具有相同的长度 N，且 0 ≤ N ≤ 500 。所有整数的范围在 -228 到 228 - 1 之间，最终结果不会超过 231 - 1 。
 
 输入:
 A = [ 1, 2]
 B = [-2,-1]
 C = [-1, 2]
 D = [ 0, 2]
 
 输出:
 2
 
 解释:
 两个元组如下:
 1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
 2. (1, 1, 0, 0) -> A[1] + B[1] + C[0] + D[0] = 2 + (-1) + (-1) + 0 = 0
 
*/
import Foundation

class FourSum2 {
    func solution1(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        // key：A+B的和，value:和的个数
        var sum1Info = Dictionary<Int,Int>()
        for i in A {
            for j in B {
                let sum1 = i + j
                if let count = sum1Info[sum1] {
                    sum1Info[sum1] = count + 1
                }
                else {
                    sum1Info[sum1] = 1
                }
            }
        }
        
        // key：C+D的和，value:和的个数
        var total = 0
        for k in C {
            for l in D {
                let sum2 = k + l
                if let count = sum1Info[-sum2] {
                    total += count
                }
            }
        }

        return total
    }
}
