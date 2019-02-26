//
//  43-MultiplyStrings.swift
//  String
//
//  Created by Csy on 2019/2/25.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 输入: num1 = "2", num2 = "3"
 输出: "6"
 
 思路1：拆分成加法
    1 定义两个字符串相加的方法
    2 定义s1 * num的方法，则可以转换成num个s1相加，并且用递归完成。num<10
    3 在定义s1 * num的方法，num为10，100，1000等整数
    3 假如s2的长度较小，则将s2转换成多个整型，再和s1做乘法，并且累加
 
 思路2：根据规律
    1 num[i]*num[j]在数组的位置是[i+j,i+j+1]
     1 2 3
 *     4 5
 ---------
       1 5
     1 0
   0 5
 ---------
   0 6 1 5
     1 2
   0 8
 0 4
 ---------
 0 5 5 3 5
 */

import Foundation

class MultiplyStrings {
    func multiply(_ num1: String, _ num2: String) -> String {
        let count1 = num1.count
        let count2 = num2.count
        
        if count1 == 0 || count2 == 0 {
            return ""
        }
        
        var results: [Int] = Array(repeating: 0, count: count1+count2)
        let nums1 = num1.map {return Int(String($0))!}
        let nums2 = num2.map {return Int(String($0))!}
        
        for i in (0...count1-1).reversed() {
            for j in (0...count2-1).reversed() {
                var aMultiply = nums1[i] *  nums2[j]
                aMultiply += results[i+j+1]     // 累加低位值：results[i+j+1]
                
                // 将结果分配到[i+j]和[i+j+1]
                results[i+j] = results[i+j] + aMultiply / 10
                results[i+j+1] = aMultiply % 10
            }
        }
        
        // 去掉前面的0
        var start = 0
        while start < results.count && results[start] == 0 {
            start += 1
        }
        
        // 拼接成结果字符串"0"
        if start == results.count {
            return "0"
        }
        
        // 非0的结果字符串
        var i = start
        var resultStr = ""
        while i < results.count {
            resultStr = resultStr + "\(results[i])"
            i += 1
        }
        
        return resultStr
    }
}
