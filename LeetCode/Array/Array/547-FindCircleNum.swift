//
//  547-FindCircleNum.swift
//  Array
//
//  Created by Csy on 2019/3/25.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class FindCircleNum {
    func findCircleNum(_ M: [[Int]]) -> Int {
        let length = M.count
        if length == 0 {
            return 0
        }
        
        var visited = Array(repeating: false, count: length)
        var count = 0
        
        for i in 0..<length {
            if !visited[i] {
                count += 1
                self.dfs(M, &visited, i)
            }
        }
        return count
    }
    
    func dfs(_ M: [[Int]], _ visited: inout [Bool], _ i: Int) -> Void {
        for j in 0..<M.count {
            if (M[i][j] == 1) && !visited[j] {
                visited[j] = true
                dfs(M, &visited, j)
            }
        }
    }
}
