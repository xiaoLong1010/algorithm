//
//  main.m
//  QueueWithTwoStacks
//
//  Created by Csy on 2018/11/5.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

@interface Queue : NSObject

@property (nonatomic, strong) Stack *stack1;
@property (nonatomic, strong) Stack *stack2;

- (void)enqueue:(id)object;
- (id)dequeue;

@end

@implementation Queue

- (instancetype)init {
    if (self = [super init]) {
        _stack1 = [[Stack alloc] init];
        _stack2 = [[Stack alloc] init];
    }
    return self;
}

- (void)enqueue:(id)object {
    if (![object isKindOfClass:[NSObject class]]) {
        return;
    }
    [self.stack1 push:object];
}

- (id)dequeue {
    if ([self.stack2 isEmpty]) {
        // move the object from stack1 to stack2
        while (![self.stack1 isEmpty]) {
            [self.stack2 push:[self.stack1 pop]];
        }
    }

    return [self.stack2 pop];
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Queue *queue = [[Queue alloc] init];
        [queue enqueue:@"1"];
        [queue enqueue:@"2"];
        [queue enqueue:@"3"];
        [queue enqueue:@"4"];
        
        NSLog(@"dequeue:%@",[queue dequeue]);
        
        [queue enqueue:@"5"];
        [queue enqueue:@"6"];
        
         NSLog(@"dequeue:%@",[queue dequeue]);
    }
    return 0;
}
