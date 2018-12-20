//
//  main.swift
//  Serialize
//
//  Created by Csy on 2018/12/20.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation
class BinaryTreeNode {
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ val: Int) {
        self.value = val
        self.left = nil
        self.right = nil
    }
}

func serizlize(_ root: BinaryTreeNode?) -> String {
    if root == nil {
        return "$,"
    }
    var str = ""
    str = str + "\(root!.value)" + ","
    
    str.append(serizlize(root?.left))
    str.append(serizlize(root?.right))
    
    return str
}

// "1,2,4,$,$,$,3,5,$,$,6,$,$,"
func deserialize(_ str: inout String) -> BinaryTreeNode? {
    if str.count == 0 {
        return nil
    }
    // 获取逗号前面的数字或者$
    let commaIndex = str.firstIndex(of: ",") ?? str.endIndex
    let substr = str[str.startIndex..<commaIndex]
    let num = Int(substr)

    // 删除逗号以及前面的字符
    if commaIndex != str.endIndex {
        str.removeSubrange(str.startIndex...commaIndex)
    } else {
        str.removeSubrange(str.startIndex..<commaIndex)
    }
    
    if num == nil {     // 说明是$
        return nil
    }
    
    let node = BinaryTreeNode(num!)
    node.left = deserialize(&str)
    node.right = deserialize(&str)
    
    return node

}

var num = 3

var str = "1,2,4,$,$,$,3,5,$,$,6,$,$,"

let node = deserialize(&str)
print(node)

let newStr = serizlize(node)
print(newStr)





