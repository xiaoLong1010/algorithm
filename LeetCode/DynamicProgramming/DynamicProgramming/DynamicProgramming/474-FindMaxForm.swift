//
//  474-FindMaxForm.swift
//  DynamicProgramming
//
//  Created by Csy on 2019/2/19.
//  Copyright © 2019 CXL. All rights reserved.
//

/**
 在计算机界中，我们总是追求用有限的资源获取最大的收益。
 
 现在，假设你分别支配着 m 个 0 和 n 个 1。另外，还有一个仅包含 0 和 1 字符串的数组。
 
 你的任务是使用给定的 m 个 0 和 n 个 1 ，找到能拼出存在于数组中的字符串的最大数量。每个 0 和 1 至多被使用一次。
 
 注意:
 
 给定 0 和 1 的数量都不会超过 100。
 给定字符串数组的长度不会超过 600。
 
 输入: Array = {"10", "0001", "111001", "1", "0"}, m = 5, n = 3
 输出: 4
 
 解释: 总共 4 个字符串可以通过 5 个 0 和 3 个 1 拼出，即 "10","0001","1","0" 。
 
 dp[i][j]表示i个0，j个1的数量，还包含了剩余字符串的信息
 // 遍历字符串，这个字符串有多少个0，多少个1
 dp[i][j] = min{dp[i-str][j-str]}
 
 // 将字符串数组，转换成字典。考虑有重复字符串
    1 key是字符串
    2 value是元组，第一个值表示字符串个数，第二个值表示0的个数，第三个值表示1的个数
 */
import Foundation

class FindMaxForm {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        guard strs.count > 0 && (m > 0 || n > 0) else {
            return 0
        }
        
        // 初始化dp
        let oneRow = Array(repeating: 0, count: n+1)
        var dp = Array(repeating: oneRow, count: m+1)
        dp[0][0] = 0
        
        // 根据状态公式进行计算
        for str in strs {
            // 计算当前字符串，有多少个0和1
            var zeroCount = 0
            var oneCount = 0
            for c in str {
                if c == "0" {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            }
            
            // 一定要从最大的m和n开始计算
            // 如果从最小的开始，计算最大值s时，用次大的值加1，次大的值再用次次大的值计算，就会出问题
            var i = m
            while i >= zeroCount {
                var j = n
                while j >= oneCount {
                    dp[i][j] = max(dp[i][j], dp[i-zeroCount][j-oneCount]+1)
                    j -= 1
                }
                i -= 1
            }
        }
        
        return dp[m][n]
    }
    
    // 这个方法不对
    func findMaxForm2(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        guard strs.count > 0 && (m > 0 || n > 0) else {
            return 0
        }
        
        // 重新构造字符串信息
        var strsInfo = Dictionary<String,(countOfStr: Int, zeroInStr: Int, oneInStr: Int)>()
        for str in strs {
            var aValue = (countOfStr: 1, zeroInStr: 0, oneInStr: 0)
            // str对应的值已经存在，那只需要countOfStr加1
            // 否则需要遍历str，计算str中0和1d
            if let value = strsInfo[str] {
                aValue = value
                aValue.countOfStr += 1
            } else {
                for c in str {
                    if c == "0" {
                        aValue.zeroInStr += 1
                    } else {
                        assert(c=="1")
                        aValue.oneInStr += 1
                    }
                }
            }
            strsInfo[str] = aValue
        }
        
        // 初始化dp
        let oneRow = Array(repeating: (0,Dictionary<String,(countOfStr: Int, zeroInStr: Int, oneInStr: Int)>()), count: n+1)
        var dp = Array(repeating: oneRow, count: m+1)
        dp[0][0] = (0,strsInfo)
        
        // 根据状态公式进行计算
        for i in 0...m {
            for j in 0...n {
                
                // 遍历每个字符串
                for (str, strInfo) in strsInfo {
                    // 判断之前是否有计算好的结果
                    let previousI = i-strInfo.zeroInStr
                    let previousJ = j-strInfo.oneInStr
                    if previousI < 0 || previousJ < 0 {
                        continue
                    }
                    
                    // 判断之前的结果是否合适
                    // 1 有较大的数量
                    // 2 选择的字符串必须在剩余字符串中
                    let previousInfo = dp[previousI][previousJ]
                    if (previousInfo.0 + 1) > dp[i][j].0 {
                        if let previousStrInfo = previousInfo.1[str] {
                            if previousStrInfo.countOfStr > 0 {
                                // 满足条件之后，dp[i][j]使用这个结果来更新
                                var newInfo = previousInfo
                                newInfo.0 = previousInfo.0 + 1
                                var newStrInfo = previousStrInfo
                                newStrInfo.countOfStr -= 1      // 字符串已经被选中了，其count要减1
                                newInfo.1[str] = newStrInfo
                                
                                dp[i][j] = newInfo
                            }
                        }
                    }
                }
            }
        }
        
        return dp[m][n].0
    }
}
