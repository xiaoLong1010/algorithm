//
//  main.m
//  FindInSortedMatrix
//
//  Created by Csy on 2018/11/3.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL Find(NSInteger *matrix, NSInteger rows, NSInteger cols, NSInteger number);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger dimension = 3;
        NSInteger matrix[3][3] = {{1,2,8},{2,4,9},{4,7,10}};
        BOOL found = Find((NSInteger *)matrix, dimension, dimension, 13);
        if (found) {
            NSLog(@"found");
        } else {
            NSLog(@"not found");
        }
    }
    return 0;
}

BOOL Find(NSInteger *matrix, NSInteger rows, NSInteger cols, NSInteger number) {
    if (matrix == NULL || rows < 0 || cols < 0) {
        return NO;
    }
    
    NSInteger rowNum = 0;
    NSInteger colNum = cols - 1;
    
    while (rowNum < rows && colNum >= 0) {
        NSInteger value = matrix[rowNum * cols + colNum];
        if (number == value) {
            return YES;
        } else if(number > value) {     // 从更大的行数开始找
            rowNum++;
        } else {                    // 从更小的列数开始找
            colNum--;
        }
    }
    
    return NO;
}
