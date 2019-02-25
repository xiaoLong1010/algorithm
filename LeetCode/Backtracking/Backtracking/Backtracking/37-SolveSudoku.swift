//
//  37-SolveSudoku.swift
//  Backtracking
//
//  Created by Csy on 2019/2/23.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 编写一个程序，通过已填充的空格来解决数独问题。
 
 一个数独的解法需遵循如下规则：
    数字 1-9 在每一行只能出现一次。
    数字 1-9 在每一列只能出现一次。
    数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 空白格用 '.' 表示。
 
 */

import Foundation

class SolveSudoku {
    // 记录某行，某位数字是否已经被摆放
    private var rowOccupation = [[Bool]]()
    
    // 记录某列，某位数字是否已经被摆放
    private var colOccupation = [[Bool]]()
    
    // 记录某 3x3 宫格内，某位数字是否已经被摆放
    private var matrixOccupation = [[Bool]]()
    
    func solveSudoku(_ board: inout [[Character]]) {
        
        // 先初始化成员变量
        let sudoCount = 9
        let oneRow = Array(repeating: false, count: sudoCount+1)
        self.rowOccupation = Array(repeating: oneRow, count: sudoCount)
        self.colOccupation = self.rowOccupation
        self.matrixOccupation = self.rowOccupation
        for i in 0..<sudoCount {
            for j in 0..<sudoCount {
                let char = board[i][j]
                if char != "." {
                    if let num = Int(String(char)) {
                        self.rowOccupation[i][num] = true
                        self.colOccupation[j][num] = true
                        self.matrixOccupation[i / 3 * 3 + j / 3][num] = true
                    }
                }
            }
        }
        _ = self.dfs(&board, 0, 0)
    }
    
    func dfs(_ board: inout [[Character]], _ x: Int, _ y: Int) -> Bool {
        // 找到空位置
        var x = x
        var y = y
        while board[x][y] != "." {
            // 新的一行
            y += 1
            if y >= 9 {
                x += 1
                y = 0
            }
            if x >= 9 {
                return true
            }
        }
        
        // 将
        for num in 1...9 {
            let xInMatrix = x / 3 * 3 + y / 3
            if !self.rowOccupation[x][num] &&
               !self.colOccupation[y][num] &&
                !self.matrixOccupation[xInMatrix][num] {
                
                board[x][y] = ("\(num)".first)!
                self.rowOccupation[x][num] = true
                self.colOccupation[y][num] = true
                self.matrixOccupation[xInMatrix][num] = true
                
                if dfs(&board, x, y) {
                    return true
                } else {
                    self.rowOccupation[x][num] = false
                    self.colOccupation[y][num] = false
                    self.matrixOccupation[xInMatrix][num] = false
                    board[x][y] = (".".first)!
                }
            }
        }
        return false
    }
}
