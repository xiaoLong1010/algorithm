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

var strs1 = ["0:03","0:05","0:06","0:09","0:10","0:12","0:17","0:18","0:20","0:24","0:33","0:34","0:36","0:40","0:48","1:01","1:02","1:04","1:08","1:16","1:32","2:01","2:02","2:04","2:08","2:16","2:32","3:00","4:01","4:02","4:04","4:08","4:16","4:32","5:00","6:00","8:01","8:02","8:04","8:08","8:16","8:32","9:00","10:00"]
var strs2 = ["3:00","5:00","9:00","1:01","1:02","1:04","1:08","1:16","1:32","6:00","10:00","2:01","2:02","2:04","2:08","2:16","2:32","4:01","4:02","4:04","4:08","4:16","4:32","8:01","8:02","8:04","8:08","8:16","8:32","0:03","0:05","0:09","0:17","0:33","0:06","0:010","0:18","0:34","0:12","0:20","0:36","0:24","0:40","0:48"]

strs1 = strs1.sorted()
strs2 = strs2.sorted()



func test90() -> Void {
    let answer = SubsetsWithDup()
    let result = answer.subsetsWithDup([1,1,1])
    print("result: ", result)
}
test90()

func test78() -> Void {
    let answer = Subsets()
    let result = answer.subsets([1,2])
    print("result: ", result)
}
test78()

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


