//
//  main.m
//  StackWithTwoQueues
//
//  Created by Csy on 2018/11/5.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Stack *stack = [[Stack alloc] init];
        [stack push:@"1"];
        [stack push:@"2"];
        [stack push:@"3"];
        [stack push:@"4"];
        
        NSLog(@"pop:%@",[stack pop]);
        
        [stack push:@"5"];
        [stack push:@"6"];
        
        NSLog(@"dequeue:%@",[stack pop]);
    }
    return 0;
}
