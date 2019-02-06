//
//  main.swift
//  Backtracking
//
//  Created by Csy on 2018/12/22.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

/**
 17. Letter Combinations of a Phone Number
 93. Restore IP Addresses
 131. Palindrome Partitioning,回文子字符串
 
 // 排列
 // 一定要注意有标记
 // 之后要取消标记
 46. Permutations
 47. Permutations II
 
 // 组合
 // 前面已经用过的数字，不能再用了
 77. Combinations
 39. Combination Sum
 40. Combination Sum II
 216. Combination Sum III
 78. Subsets
 90. Subsets II
 401 Binary Watch
 
 // 二维问题
 79. Word Search
 200. Number of Islands
 
 */

//var solution = LetterCombinations()
//let result  = solution.letterCombinations("23")
//print(result)

//let perm = Permutations()
//print(perm.permute([1,2,3]))

//let comb = Combinations()
//print(comb.combina(4, 2))

func test93() -> Void {
    let answer = RestoreIpAddresses()
    let result = answer.solution1("25525511135")
    print("result: ", result)
}
test93()

func test79_WordSearch() -> Void {
    let search = WordSearch()
    let one: [Character] = ["a","b","t","g"]
    let two: [Character] = ["c","f","c","s"]
    let three: [Character] = ["j","d","e","h"]
    let board = [
        one,
        two,
        three
    ]

    print(search.exist(board, "bfce"))
    print(search.exist(board, "abfb"))
}
//test79_WordSearch()


