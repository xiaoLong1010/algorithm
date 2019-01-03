//
//  455-AssignCookies.swift
//  Greedy
//
//  Created by Csy on 2019/1/3.
//  Copyright © 2019 CXL. All rights reserved.
//

import Foundation

class AssignCookies {
    func solution1(_ greeds: Array<Int>, _ cookies: Array<Int>) -> Int {
        
        // 先排序
        var greeds = greeds.sorted()
        var cookies = cookies.sorted()
        
        // 初始值
        var res = 0
        var index1 = 0
        var index2 = 0
        
        let greedLength = greeds.count
        let cookieLength = cookies.count
        
        while index1 < greedLength && index2 < cookieLength {
            if cookies[index2] >= greeds[index1] {
                res = res + 1
                index1 = index1 + 1
            }
            index2 = index2 + 1
        }
        
        return res
    }
}
