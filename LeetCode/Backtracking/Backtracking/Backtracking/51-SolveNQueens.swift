//
//  51-SolveNQueens.swift
//  Backtracking
//
//  Created by Csy on 2019/2/7.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class SolveNQueens {
    private var results = Array<Array<String>>()
    private var colTaken = [Bool]()
    private var dia1 = [Bool]()
    private var dia2 = [Bool]()
    
    func solution1(_ n: Int) -> [[String]] {
        if n <= 0 {
            return []
        }
        
        self.colTaken = Array(repeating: false, count: n)
        self.dia1 = Array(repeating: false, count: 2 * n - 1)
        self.dia2 = Array(repeating: false, count: 2 * n - 1)
        
        var occupation = [Int]()
        self.putQueues(n, 0, &occupation)
        
        return self.results
    }
    
    
    /// 放置皇后
    ///
    /// - Parameters:
    ///   - n: 皇后的数量
    ///   - index: 在哪一行放皇后
    ///   - occupation: [0,index-1]行，再哪一列放了皇后
    func putQueues(_ n: Int, _ index: Int, _ occupation: inout [Int]) -> Void {
        if index == n {
            var aResult = [String]()
            
            for row in 0..<n {
                var chars:[Character] = Array(repeating: ".", count: n)
                chars[occupation[row]] = "Q"
                aResult.append(String(chars))
            }
            self.results.append(aResult)
        }
        
        for col in 0..<n {
            if !self.colTaken[col] && !self.dia1[index+col] && !self.dia2[index-col+n-1] {
                occupation.append(col)
                self.colTaken[col] = true
                self.dia1[index+col] = true
                self.dia2[index-col+n-1] = true
                
                putQueues(n, index+1, &occupation)
                
                occupation.removeLast()
                self.colTaken[col] = false
                self.dia1[index+col] = false
                self.dia2[index-col+n-1] = false
            }
        }
    }
}
