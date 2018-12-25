//
//  343-IntegerBreak.swift
//  DynamicPlanning
//
//  Created by Csy on 2018/12/25.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

class IntegerBreak {
    private var historyList = Array<Int>()
    
    func maxWith(num1: Int, num2: Int, num3: Int) -> Int {
        return max(num1, max(num2, num3))
    }
    
    func solution1(_ num: Int) -> Int {
        return self.solutionCore1(num)
    }
    
    func solutionCore1(_ num: Int) -> Int {
        if num == 1 {
            return 1
        }
        
        var tempMax = -1
        for index in 1...(num-1) {
            let temp1 = index * (num-index) // 不再进行分解，直接求乘积
            let temp2 = index * self.solutionCore1(num-index) // 分解之后，再求乘积
            tempMax = self.maxWith(num1: tempMax, num2: temp1, num3: temp2)
        }
        
        return tempMax
    }
    
    func solution2(_ num: Int) -> Int {
        self.historyList = Array(repeating: -1, count: num+1)
        return self.solutionCore2(num)
    }
    
    func solutionCore2(_ num: Int) -> Int {
        self.historyList[1] = 1
        
        // 已经存在最优解
        if self.historyList[num] != -1 {
            return self.historyList[num]
        }
        
        var tempMax = -1
        for index in 1...(num-1) {
            let temp1 = index * (num-index) // 不再进行分解，直接求乘积
            let temp2 = index * self.solutionCore2(num-index) // 分解之后，再求乘积
            tempMax = self.maxWith(num1: tempMax, num2: temp1, num3: temp2)
        }
        self.historyList[num] = tempMax
        
        return self.historyList[num]
    }
    
    func solution3(_ num: Int) -> Int {
        
        self.historyList = Array(repeating: -1, count: num+1)
        self.historyList[1] = 1
        
        // 从下到上，依次求，2，3，4，。。。num的最大值
        for i in 2...num {
            // 下面的循环，是求i的最大值
            for j in 1...(i-1) {
                let temp1 = j * (i-j) // 不再进行分解，直接求乘积
                let temp2 = j * self.historyList[i-j] // 直接取保存的最大值
                self.historyList[i] = self.maxWith(num1: temp1, num2: temp2, num3: self.historyList[i]) // 更新i的最大值
            }
        }
        return self.historyList[num]
    }
}
