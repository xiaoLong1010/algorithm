//
//  200-NumIslands.swift
//  Backtracking
//
//  Created by Csy on 2019/2/7.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class NumIslands {
    private var visited = Array<Array<Bool>>()
    private var d = [[0, 1], [1, 0], [0, -1], [-1, 0]];
    
    func solution1(_ grid: [[Character]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        let rowLength = grid.count
        let colLength = grid[0].count
        
        //先初始化visited二维数组
        let oneCol = Array(repeating: false, count: colLength)
        self.visited = Array(repeating: oneCol, count: rowLength)
        
        var num = 0
        
        for x in 0..<rowLength {
            for y in 0..<colLength {
                let char = grid[x][y]
                // 找到一个合适，数量就加1
                // 再用dfs，将其周边的都填充了
                if char == "1" && !self.visited[x][y] {
                    num += 1
                    dfs(grid, x, y)
                }
            }
        }
        return num
    }
    
    // 从坐标x，y进行flood fill，填充，不用进行重置
    func dfs(_ grid: [[Character]], _ x: Int, _ y: Int) -> Void {
        self.visited[x][y] = true
        
        for i in 0...3 {
            let newX = x + self.d[i][0]
            let newY = y + self.d[i][1]
            if self.inGrid(grid, newX, newY) && !self.visited[newX][newY] && grid[newX][newY] == "1" {
                dfs(grid, newX, newY)
            }
        }
        return
    }
    
    func solution2(_ grid: [[Character]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        
        var grid = grid
        let rowLength = grid.count
        let colLength = grid[0].count
        
        var num = 0
        for x in 0..<rowLength {
            for y in 0..<colLength {
                let char = grid[x][y]
                // 找到一个合适，数量就加1
                // 再用dfs，将其周边的都填充了
                if char == "1" {
                    num += 1
                    dfs2(&grid, x, y)
                }
            }
        }
        return num
    }
    
    func dfs2(_ grid: inout [[Character]], _ x: Int, _ y: Int) -> Void {
        grid[x][y] = "0"
        
        for i in 0...3 {
            let newX = x + self.d[i][0]
            let newY = y + self.d[i][1]
            if self.inGrid(grid, newX, newY) && grid[newX][newY] == "1" {
                dfs2(&grid, newX, newY)
            }
        }
        return
    }
    
    func inGrid(_ grid: [[Character]], _ x: Int, _ y: Int) -> Bool {
        let rowCount = grid.count
        let colCount = grid[0].count
        
        return x >= 0 && x < rowCount && y >= 0 && y < colCount
    }
}


