//
//  main.m
//  NumberOf1
//
//  Created by Csy on 2018/11/11.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>
// 1001>>1 = 1100，负数左移是要补1的

NSInteger countOf1(NSInteger num) {
    NSInteger count = 0;
    NSUInteger flag = 1;
    while (flag) {
        if (num & flag) {
            count++;
        }
        flag = flag << 1;
    }
    return count;
}

NSInteger countOf1_2(NSInteger num) {
    NSInteger count = 0;
    while (num) {
        count++;
        num = num & (num - 1);
    }
    return count;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger num = 0b1101001001001;
        NSInteger count1 = countOf1(num);
        NSInteger count2 = countOf1_2(num);
        if (count1 == count2) {
            NSLog(@"OK");
        }
    }
    return 0;
}
