//
//  main.m
//  Print1ToN
//
//  Created by Csy on 2018/11/13.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL increment(NSMutableString *numString);
void print(NSString *numString);
void printRecursively(NSMutableString *numString, NSInteger index);

void print1ToN_1(NSUInteger num);
void print1ToN_2(NSUInteger num);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        print1ToN_1(2);
        
        print1ToN_2(2);
    }
    return 0;
}

void print1ToN_1(NSUInteger num) {
    NSMutableString *numString = [NSMutableString stringWithCapacity:num];
    while (num > 0) {
        [numString appendString:@"0"];
        num--;
    }
 
    while (!increment(numString)) {
        print(numString);
    } ;
}

void print1ToN_2(NSUInteger num) {
    NSMutableString *numString = [NSMutableString stringWithCapacity:num];
    while (num > 0) {
        [numString appendString:@"0"];
        num--;
    }
    
    for (NSInteger j = 0; j < 10; j++) {
        NSString *indexString = [NSString stringWithFormat:@"%@", @(j)];
        [numString replaceCharactersInRange:NSMakeRange(0, 1) withString:indexString];
        printRecursively(numString, 0);
    }
}

// 字符串加1操作。返回是否溢出了，也就是说字符串是否是"9999"之类
BOOL increment(NSMutableString *numString) {
    NSInteger length = numString.length;
    NSInteger takeOver = 0;
    BOOL isOverFlow = NO;
    for (NSInteger index = length - 1; index >= 0; index--) {
        // index位的值是多少
        NSInteger indexNum = [numString characterAtIndex:index] - '0';
        if (index == length - 1) {
            indexNum += 1;
        }
        indexNum += takeOver;
        
        // index的值超过10，需要进位
        if (indexNum > 9) {
            // 最高位超过10了，说明整个字符串就是"99999"
            if (index == 0) {
                isOverFlow = YES;
            } else {
                indexNum -= 10;
                takeOver = 1;
                NSString *indexString = [NSString stringWithFormat:@"%@", @(indexNum)];
                [numString replaceCharactersInRange:NSMakeRange(index, 1) withString:indexString];
            }
        } else {
            NSString *indexString = [NSString stringWithFormat:@"%@", @(indexNum)];
            [numString replaceCharactersInRange:NSMakeRange(index, 1) withString:indexString];
            break;
        }
    }
    
    return isOverFlow;
}

void print(NSString *numString) {
    NSInteger length = numString.length;
    for (NSInteger index = 0; index < length; index++) {
        BOOL notZero = ([numString characterAtIndex:index] != '0');
        if (notZero) {
            NSString *subString = [numString substringFromIndex:index];
            NSLog(@"%@", subString);
            break;
        }
    }
}

// 表示index所在的值已经确定了，需要设置index之后的值，并且进行打印
void printRecursively(NSMutableString *numString, NSInteger index) {
    NSInteger length = numString.length;
    
    if (index == length - 1) {
        print(numString);
        return;
    }
    
    for (NSInteger j = 0; j < 10; j++) {
        // 设置index+1的值
        NSString *indexString = [NSString stringWithFormat:@"%@", @(j)];
        [numString replaceCharactersInRange:NSMakeRange(index+1, 1) withString:indexString];
        
        printRecursively(numString, index + 1);
    }
}
