//
//  main.swift
//  Accumulate
//
//  Created by Csy on 2018/12/9.
//  Copyright © 2018 CXL. All rights reserved.
//

import Foundation

func accumulate1(_ num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    
    return num + accumulate1(num - 1)
}

func accumulate2(_ num: Int) -> Int {
    var t = 0
    var b = (num > 0) && ((t = num + accumulate1(num - 1)) > (0))

    return t
}
