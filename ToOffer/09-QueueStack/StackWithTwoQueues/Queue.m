//
//  Queue.m
//  StackWithTwoQueues
//
//  Created by Csy on 2018/11/5.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "Queue.h"

@interface Queue ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Queue

- (instancetype)init {
    if (self = [super init]) {
        _array = [NSMutableArray array];
    }
    return self;
}

- (void)enqueue:(id)object {
    if (object == nil) {
        return;
    }
    [self.array addObject:object];
}

- (id)dequeue {
    id object = [self.array firstObject];
    if (object) {
        [self.array removeObject:object];
    }
    return object;
}

- (BOOL)isEmpty {
    return (self.array.count == 0);
}

- (NSInteger)count {
    return self.array.count;
}

@end
