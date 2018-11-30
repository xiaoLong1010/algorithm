//
//  main.swift
//  MaxValueOfGifts
//
//  Created by Csy on 2018/11/29.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func maxValue(_ giftMatrix: [[Int]]) -> Int {
    let rowCount = giftMatrix.count
    let colCount = giftMatrix[0].count
    
    var maxCounts = Array<Int>(repeating: 0, count: colCount)
    
    for i in 0..<rowCount {
        for j in 0..<colCount {
            var left = 0        // (i,j)左边坐标的最大礼物值
            var up = 0          // (i,j)上边坐标的最大礼物值
            
            if j > 0 {
                left = maxCounts[j - 1]
            }
            
            if i > 0 {
                up = maxCounts[j]
            }
            
            let currentMax = max(left, up) + giftMatrix[i][j]
            
            maxCounts[j] = currentMax
        }
    }
    return maxCounts.last!
}

var matrix = [[1,10,3,8],
              [12,2,9,6],
              [5,7,4,11],
              [3,7,16,5]]

var max = maxValue(matrix)
print(max)
