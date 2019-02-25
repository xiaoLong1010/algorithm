//
//  417-PacificAtlantic.swift
//  Backtracking
//
//  Created by Csy on 2019/2/24.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个 m x n 的非负整数矩阵来表示一片大陆上各个单元格的高度。“太平洋”处于大陆的左边界和上边界，而“大西洋”处于大陆的右边界和下边界。
 
 规定水流只能按照上、下、左、右四个方向流动，且只能从高到低或者在同等高度上流动。
 
 请找出那些水流既可以流动到“太平洋”，又能流动到“大西洋”的陆地单元的坐标。
 
 给定下面的 5x5 矩阵:
 
 太平洋 ~   ~   ~   ~   ~
 ~  1   2   2   3  (5) *
 ~  3   2   3  (4) (4) *
 ~  2   4  (5)  3   1  *
 ~ (6) (7)  1   4   5  *
 ~ (5)  1   1   2   4  *
 *   *   *   *   * 大西洋
 
 返回:
 
 [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]] (上图中带括号的单元).
 
 */

import Foundation

class PacificAtlantic {
    private var results = [[Int]]()
    
    private var resultsMatrix = [[Bool]]()
    private var visited = Array<Array<Bool>>()
    private var d = [[0, 1], [1, 0], [0, -1], [-1, 0]];
    
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        if matrix.count == 0 || matrix[0].count == 0 {
            return []
        }
        let rowLength = matrix.count
        let colLength = matrix[0].count
        
        //先初始化visited二维数组
        let oneCol = Array(repeating: false, count: colLength)
        let unvisited = Array(repeating: oneCol, count: rowLength)
        self.resultsMatrix = unvisited
        
        // 对于每一个坐标，都进行一次判断
        for x in 0..<rowLength {
            for y in 0..<colLength {
                self.visited = unvisited
                var aResult: (isPacific: Bool, isAtlantic: Bool) = (false,false)
                self.dfs(matrix, x, y, &aResult)
                if aResult.isPacific && aResult.isAtlantic {
                    self.results.append([x,y])
                    self.resultsMatrix[x][y] = true
                }
            }
        }
        return self.results
    }
    
    
    /// 以坐标(x,y)为起点，不断地向四个方向遍历，看遍历到的点，是否经过大西洋和太平洋
    ///
    /// - Parameters:
    ///   - matrix:
    ///   - x:
    ///   - y:
    ///   - previous: 之前遍历所有的点的结果
    func dfs(_ matrix: [[Int]], _ x: Int, _ y: Int,_ previous: inout (isPacific: Bool, isAtlantic: Bool)) -> Void {
        let row = matrix.count
        let col = matrix[0].count
        
        // 先判断坐标本身是否经过大西洋和太平洋
        let result = self.parse(row, col, x, y)
        if result.isPacific || previous.isPacific {
            previous.isPacific = true
        }
        if result.isAtlantic || previous.isAtlantic {
            previous.isAtlantic = true
        }
        if previous.isPacific && previous.isAtlantic {
            return
        }
        
        self.visited[x][y] = true
        for i in 0...3 {
            let newX = x + self.d[i][0]
            let newY = y + self.d[i][1]
            
            if self.inGrid(matrix, newX, newY) && !self.visited[newX][newY] && matrix[x][y] >= matrix[newX][newY] {
                // 如果新坐标坐标本身就是结果，那(x,y)一定也是正确结果
                if self.resultsMatrix[newX][newY] {
                    previous = (true, true)
                    return
                } else {
                    dfs(matrix, newX, newY, &previous)
                }
            }
        }
    }
    
    /// 判断该坐标(x,y)是否流入太平洋或者大西洋
    func parse(_ rowCount: Int, _ colCount: Int, _ x: Int, _ y: Int) -> (isPacific: Bool, isAtlantic: Bool) {
        var result: (isPacific: Bool, isAtlantic: Bool) = (false,false)
        if x == 0 || y == 0 {
            result.isPacific = true
        }
        
        if x == rowCount-1 || y == colCount-1 {
            result.isAtlantic = true
        }
        
        return result
    }
    
    func inGrid(_ grid: [[Int]], _ x: Int, _ y: Int) -> Bool {
        let rowCount = grid.count
        let colCount = grid[0].count
        
        return x >= 0 && x < rowCount && y >= 0 && y < colCount
    }
}
