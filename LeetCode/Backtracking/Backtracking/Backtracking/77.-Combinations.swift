//
//  77.-Combinations.swift
//  Backtracking
//
//  Created by Csy on 2018/12/22.
//  Copyright © 2018 CXL. All rights reserved.
//

/**
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。
 输入: n = 4, k = 2
 输出:
 [
 [2,4],
 [3,4],
 [2,3],
 [1,2],
 [1,3],
 [1,4],
 ]
 */

import Foundation

class Combinations {
    private var result = Array<Array<Int>>()
    
    func combina(_ n: Int, _ k: Int) -> Array<Array<Int>> {
        self.result.removeAll()
        
        if n <= 0 || k <= 0 || k > n {
            return self.result
        }
        var subList = Array<Int>()
        
        self.generateCombinations(num: n, k: k, 1, &subList)
        
        return self.result
    }
    
    func generateCombinations(num: Int,k: Int, _ start: Int, _ subCombina: inout Array<Int>) -> Void {
        if subCombina.count == k {
            self.result.append(subCombina)
            return
        }
        
        if start > num {
            return
        }
        
        // 下一次从index+1开始，之前都不能要
        // 还有k - subCombina.count()个空位, 所以, [i...n] 中至少要有这么多个元素
        // maxIndex最大值 n - left + 1
        let left = k - subCombina.count     // 剩下需要选的数字
        let maxIndex = num - left + 1
        for index in start...maxIndex {
            subCombina.append(index)
            generateCombinations(num: num, k: k, index+1, &subCombina)
            subCombina.removeLast()
        }
    }
}
