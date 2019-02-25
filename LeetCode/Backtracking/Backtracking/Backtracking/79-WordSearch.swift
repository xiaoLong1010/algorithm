//
//  79-WordSearch.swift
//  Backtracking
//
//  Created by Csy on 2018/12/23.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class WordSearch {
    private var visited = Array<Array<Bool>>()
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.count == 0 || board[0].count == 0 || word.count == 0 {
            return false
        }
        let rowLength = board.count
        let colLength = board[0].count
        
        //先初始化visited二维数组
        let oneCol = Array(repeating: false, count: colLength)
        self.visited = Array(repeating: oneCol, count: rowLength)
        
        // 遍历board，查看以每一个坐标为起点，是否存在字符串
        for x in 0..<rowLength {
            for y in 0..<colLength {
                let result = searchWord(board, searchStr: word, startFromStr: 0, xInBoard: x, yInBoard: y)
                if result {
                    print(x,y)
                    return true
                }
            }
        }
        return false
    }
    
    // 以board的x,y坐标为起点开始找，看是否能够找到
    func searchWord(_ board:Array<Array<Character>>, searchStr str: String, startFromStr index: Int, xInBoard x: Int, yInBoard y: Int) -> Bool {
        
        // 比较到最后一个字符了，看是否相等
        if index == str.count - 1 {
            return board[x][y] == str.last!
        }
        
        let strCurrentIndex = str.index(str.startIndex, offsetBy: index)
        let currentChar = str[strCurrentIndex]
        
        // 以x,y为中心，上，左，下，右，四个方向开始找
        if currentChar == board[x][y] {
            visited[x][y] = true
            
            // 从上开始找
            var validPosition = (x - 1 >= 0) && !visited[x - 1][y]
            if validPosition &&  searchWord(board, searchStr: str, startFromStr: index+1, xInBoard: x-1, yInBoard: y) {
                return true
            }
            
            // 从左开始找
            validPosition = (y - 1 >= 0) && !visited[x][y - 1]
            if validPosition && searchWord(board, searchStr: str, startFromStr: index+1, xInBoard: x, yInBoard: y-1) {
                return true
            }
            
            // 从下开始找
            validPosition = (x + 1 < board.count) && !visited[x + 1][y]
            if validPosition && searchWord(board, searchStr: str, startFromStr: index+1, xInBoard: x+1, yInBoard: y) {
                return true
            }
            
            // 从右开始找
            validPosition = (y + 1 < board[0].count) && !visited[x][y + 1]
            if validPosition && searchWord(board, searchStr: str, startFromStr: index+1, xInBoard: x, yInBoard: y+1) {
                return true
            }
            
            // 如果都找不到，visited要复位
            visited[x][y] = false
        }
        
        return false
    }
}
