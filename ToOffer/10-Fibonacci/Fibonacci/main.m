//
//  main.m
//  Fibonacci
//
//  Created by Csy on 2018/11/3.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger fibonacci(NSInteger num);
NSInteger fibonacci2(NSInteger num);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger num = 10;
        NSInteger result1 = fibonacci(num);
        NSInteger result2 = fibonacci2(num);
        
        if (result1 == result2) {
            NSLog(@"the two fibonacci is ok");
        }
    }
    return 0;
}

NSInteger fibonacci(NSInteger num) {
    if (num <= 0) {
        return 0;
    }
    
    if (num == 1) {
        return 1;
    }
    
    return fibonacci(num - 1) + fibonacci(num - 2);
}

NSInteger fibonacci2(NSInteger num) {
    if (num <= 0) {
        return 0;
    }
    
    if (num == 1) {
        return 1;
    }
    
    NSInteger left = 1;
    NSInteger right = 0;
    NSInteger total = 0;
    
    for (NSInteger index = 2; index <= num; index++) {
        total = left + right;
        right = left;
        left = total;
    }
    
    return total;
}


