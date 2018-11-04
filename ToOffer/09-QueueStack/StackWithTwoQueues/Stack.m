//
//  Stack.m
//  StackWithTwoQueues
//
//  Created by Csy on 2018/11/5.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "Stack.h"
#import "Queue.h"

@interface Stack ()

@property (nonatomic, strong) Queue *queue1;
@property (nonatomic, strong) Queue *queue2;

@end

@implementation Stack

- (instancetype)init {
    if (self = [super init]) {
        _queue1 = [[Queue alloc] init];
        _queue2 = [[Queue alloc] init];
    }
    return self;
}

- (void)push:(id)object {
    if (![object isKindOfClass:[NSObject class]]) {
        return;
    }
    
    if ([self.queue1 isEmpty] && [self.queue2 isEmpty]) {
        [self.queue1 enqueue:object];
    } else if (![self.queue1 isEmpty]) {
        [self.queue1 enqueue:object];
    } else if (![self.queue2 isEmpty]) {
        [self.queue2 enqueue:object];
    }
}

- (id)pop {
    if (![self.queue1 isEmpty]) {
        while ([self.queue1 count] > 1) {
            [self.queue2 enqueue:[self.queue1 dequeue]];
        }
        return [self.queue1 dequeue];
    } else if (![self.queue2 isEmpty]) {
        while ([self.queue2 count] > 1) {
            [self.queue1 enqueue:[self.queue2 dequeue]];
        }
        return [self.queue2 dequeue];
    }
    return nil;
}

@end
