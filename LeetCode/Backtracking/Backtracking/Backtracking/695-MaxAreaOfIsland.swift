//
//  695-MaxAreaOfIsland.swift
//  Backtracking
//
//  Created by Csy on 2019/2/27.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个包含了一些 0 和 1的非空二维数组 grid , 一个 岛屿 是由四个方向 (水平或垂直) 的 1 (代表土地) 构成的组合。你可以假设二维矩阵的四个边缘都被水包围着。
 
 找到给定的二维数组中最大的岛屿面积。(如果没有岛屿，则返回面积为0。)
 
 [[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
 
 对于上面这个给定矩阵应返回 6。注意答案不应该是11，因为岛屿只能包含水平或垂直的四个方向的‘1’
 */
import Foundation
class MaxAreaOfIsland {
    private var visited = Array<Array<Bool>>()
    private var d = [[0, 1], [1, 0], [0, -1], [-1, 0]];
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        let rowLength = grid.count
        let colLength = grid[0].count
        
        //先初始化visited二维数组
        let oneCol = Array(repeating: false, count: colLength)
        self.visited = Array(repeating: oneCol, count: rowLength)
        
        // 回溯法查找所有结果
        var maxCount = 0
        for x in 0..<rowLength {
            for y in 0..<colLength {
                let num = grid[x][y]
                var count = 0
                // 找到一个合适，数量就加1
                // 再用dfs，将其周边的都填充了
                if num == 1 && !self.visited[x][y] {
                    dfs(grid, x, y, &count)
                    maxCount = max(maxCount, count)
                }
            }
        }
        
        return maxCount
    }
    
    /// 从坐标x，y进行填充，不用进行重置
    /// 遇到1就进行填充
    /// - Parameters:
    ///   - grid: 所有的数据
    ///   - x: 坐标x
    ///   - y: 坐标x
    ///   - count: 之前填充的数量
    func dfs(_ grid: [[Int]], _ x: Int, _ y: Int, _ count: inout Int) -> Void {
        self.visited[x][y] = true
        count += 1
        
        for i in 0...3 {
            let newX = x + self.d[i][0]
            let newY = y + self.d[i][1]
            if self.inGrid(grid, newX, newY) && !self.visited[newX][newY] && grid[newX][newY] == 1 {
                dfs(grid, newX, newY, &count)
            }
        }
        return
    }
    
    func inGrid(_ grid: [[Int]], _ x: Int, _ y: Int) -> Bool {
        let rowCount = grid.count
        let colCount = grid[0].count
        
        return x >= 0 && x < rowCount && y >= 0 && y < colCount
    }
}
