//
//  455-AssignCookies.swift
//  Greedy
//
//  Created by Csy on 2019/1/3.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

/**
 假设你是一位很棒的家长，想要给你的孩子们一些小饼干。但是，每个孩子最多只能给一块饼干。对每个孩子 i ，都有一个胃口值 gi ，这是能让孩子们满足胃口的饼干的最小尺寸；并且每块饼干 j ，都有一个尺寸 sj 。如果 sj >= gi ，我们可以将这个饼干 j 分配给孩子 i ，这个孩子会得到满足。你的目标是尽可能满足越多数量的孩子，并输出这个最大数值。
 输入: [1,2], [1,2,3]
 
 输出: 2
 
 解释:
 你有两个孩子和三块小饼干，2个孩子的胃口值分别是1,2。
 你拥有的饼干数量和尺寸都足以让所有孩子满足。
 所以你应该输出2.
 
 思路
    1 都按照从大到小排列
    2 看最大的饼干，是否满足最大的孩子
 */

class AssignCookies {
    func findContentChildren(_ greeds: Array<Int>, _ cookies: Array<Int>) -> Int {
        // 先从大到小排序
        var greeds = greeds.sorted(by: >)
        var cookies = cookies.sorted(by: >)
        
        // 初始值
        var res = 0
        var index1 = 0
        var index2 = 0
        
        let greedLength = greeds.count
        let cookieLength = cookies.count
        
        while index1 < greedLength && index2 < cookieLength {
            if cookies[index2] >= greeds[index1] {
                res += 1
                index2 += 1     // 饼干尺寸减少
            }
            
            // 贪心的值减少
            index1 += 1
        }
        
        return res
    }
    
    func findContentChildren2(_ g: [Int], _ s: [Int]) -> Int {
        var g = g.sorted(by: <)
        var s = s.sorted(by: <)
        
        var i = 0
        var j = 0
        // 饼干不够大，就一直找最大的
        while i < g.count && j < s.count {
            if g[i] <= s[j] {
                i += 1
            }
            j += 1
        }
        return i
    }
}
