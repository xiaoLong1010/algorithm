//
//  17-LetterCombinations.swift
//  Backtracking
//
//  Created by Csy on 2018/12/22.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class LetterCombinations {
    private var letterMap = [
        " ",    //0
        "",     //1
        "abc",  //2
        "def",  //3
        "ghi",  //4
        "jkl",  //5
        "mno",  //6
        "pqrs", //7
        "tuv",  //8
        "wxyz"  //9
    ]
    private var result = Array<String>()
    
    func letterCombinations(_ str: String) -> Array<String> {
        self.result.removeAll()
        
        findCombination(str, index: str.startIndex, combinationStr: "")
        return self.result
    }
    
    // combinationStr,0到index-1的组合字符串
    // index是
    func findCombination(_ digits: String, index: String.Index, combinationStr: String) -> Void {
        // 超出最后一个字符了，已经得到了结果
        if index >= digits.endIndex {
            self.result.append(combinationStr)
            return;
        }
        
        // 当前的数字
        let char = digits[index]
        let num = Int(String(char))!
        
        // 当前数字对应的所有字母
        let letters = self.letterMap[num]
        
        // 遍历所有的字母，
        for letter in letters {
            findCombination(digits, index: digits.index(after: index), combinationStr: combinationStr + "\(letter)")
        }
    }
}
