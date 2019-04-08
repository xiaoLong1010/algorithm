//
//  54-SpiralOrder.swift
//  Array
//
//  Created by Csy on 2019/4/8.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。
 */

import Foundation

class SpiralOrder {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 || matrix[0].count == 0 {
            return []
        }
        var rowCount = matrix.count
        var colCount = matrix[0].count
        let directions = [[0,1],[1,0],[0,-1],[-1,0]]     // 右，下，左，上四个方向
        
        // 先初始化
        var x = 0
        var y = -1
        var results = [Int]()
        
        while rowCount > 0 && colCount > 0 {
            // 向右走
            if rowCount > 0 && colCount > 0 {
                for _ in 0..<colCount {
                    x += directions[0][0]
                    y += directions[0][1]
                    results.append(matrix[x][y])
                }
                rowCount -= 1   //行减1
            }
            
            // 下
            if rowCount > 0 && colCount > 0 {
                for _ in 0..<rowCount {
                    x += directions[1][0]
                    y += directions[1][1]
                    results.append(matrix[x][y])
                }
                colCount -= 1   //列减1
            }
            
            // 左
            if rowCount > 0 && colCount > 0 {
                for _ in 0..<colCount {
                    x += directions[2][0]
                    y += directions[2][1]
                    results.append(matrix[x][y])
                }
                rowCount -= 1   //行减1
            }
            
            // 上
            if rowCount > 0 && colCount > 0 {
                for _ in 0..<rowCount {
                    x += directions[3][0]
                    y += directions[3][1]
                    results.append(matrix[x][y])
                }
                colCount -= 1   //列减1
            }
        }
        
        return results
    }
}
