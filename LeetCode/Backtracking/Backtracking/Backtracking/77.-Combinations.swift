//
//  77.-Combinations.swift
//  Backtracking
//
//  Created by Csy on 2018/12/22.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class Combinations {
    private var result = Array<Array<Int>>()
    
    func combina(_ num: Int, _ k: Int) -> Array<Array<Int>> {
        self.result.removeAll()
        
        if num <= 0 || k <= 0 || k > num {
            return self.result
        }
        var subList = Array<Int>()
        
        self.generateCombinations(num: num, k: k, 1, &subList)
        
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
        // index最大值 n - left + 1
        let left = k - subCombina.count
        let maxStart = num - left + 1
        for index in start...maxStart {
            subCombina.append(index)
            generateCombinations(num: num, k: k, index+1, &subCombina)
            subCombina.removeLast()
        }
    }
}
