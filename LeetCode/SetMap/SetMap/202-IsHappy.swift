//
//  202-IsHappy.swift
//  SetMap
//
//  Created by Csy on 2019/1/30.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 编写一个算法来判断一个数是不是“快乐数”。
 
 一个“快乐数”定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个过程直到这个数变为 1，也可能是无限循环但始终变不到 1。如果可以变为 1，那么这个数就是快乐数
 
 输入: 19
 输出: true
 解释:
 1^2 + 9^2 = 82,下同
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 */

import Foundation

class IsHappy {
    func isHappy(_ n: Int) -> Bool {
        // 已经计算过的数字集合
        var nums = Set<Int>()
        var num = n
        
        while num != 1 {
            if nums.contains(num) {
                return false
            }
            nums.insert(num)
            
            // 将num进行分解，求平方和
            var nextNum = 0
            while (num / 10) != 0 {
                let aNum = num % 10
                nextNum += aNum * aNum
                num /= 10
            }
            nextNum += num * num
            
            // 最终的平方和
            if nextNum == 1 {
                return true
            } else {
                num = nextNum
            }
        }
        
        return true
    }
}
