//
//  130-Solve.swift
//  Backtracking
//
//  Created by Csy on 2019/2/23.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。
 找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
 任何边界上的 'O' 都不会被填充为 'X'
 与边界上的 'O' 相连的 'O' 也不会被填充为 'X'
 
 比如
 X X X X
 X O O X
 X X O X
 X O X X
 运行你的函数后，矩阵变为：
 X X X X
 X X X X
 X X X X
 X O X X
 
 思路
    1 先从4个边开始找，以O为起点的路径，将这些O全部保存起来
    2 同时记录这些O的x的最小值，最大值，y的最小值，最大值。这是为了扫描剩余的区域，将这些O全部变成X
 
 */

import Foundation

class Solve {
    // 连接到边界的O
    private var visited = Array<Array<Bool>>()
    private var d = [[0, 1], [1, 0], [0, -1], [-1, 0]];
    
    func solve(_ board: inout [[Character]]) {
        if board.count == 0 || board[0].count == 0 {
            return
        }
        let rowLength = board.count
        let colLength = board[0].count
        
        //先初始化visited二维数组
        let oneCol = Array(repeating: false, count: colLength)
        self.visited = Array(repeating: oneCol, count: rowLength)
        
        // 遍历第0行
        var x = 0
        for y in 0...colLength-1 {
            if board[x][y] == "O" && !self.visited[x][y] {
                dfs(board, x, y)
            }
        }
        
        // 遍历最后一行
        x = rowLength-1
        for y in 0...colLength-1 {
            if board[x][y] == "O" && !self.visited[x][y] {
                dfs(board, x, y)
            }
        }
        
        // 遍历第0列
        var y = 0
        for x in 0...rowLength-1 {
            if board[x][y] == "O" && !self.visited[x][y] {
                dfs(board, x, y)
            }
        }
        
        // 遍历最后一列
        y = colLength - 1
        for x in 0...rowLength-1 {
            if board[x][y] == "O" && !self.visited[x][y] {
                dfs(board, x, y)
            }
        }
        
        // 最后遍历整个board，将没有visited的O变成X
        for x in 0..<rowLength {
            for y in 0..<colLength {
                if board[x][y] == "O" && !self.visited[x][y] {
                    board[x][y] = "X"
                }
            }
        }
    }
    
    
    /// 以[x,y]为起点，保存和它相连的O
    func dfs(_ board: [[Character]], _ x: Int, _ y: Int) -> Void {
        self.visited[x][y] = true
        
        for i in 0...3 {
            let newX = x + self.d[i][0]
            let newY = y + self.d[i][1]
            if self.inBoard(board, newX, newY) && !self.visited[newX][newY] && board[newX][newY] == "O" {
                dfs(board, newX, newY)
            }
        }
        return
    }
    
    func inBoard(_ board: [[Character]], _ x: Int, _ y: Int) -> Bool {
        let rowCount = board.count
        let colCount = board[0].count
        
        return x >= 0 && x < rowCount && y >= 0 && y < colCount
    }
}
