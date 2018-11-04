//
//  Stack.m
//  QueueWithTwoStacks
//
//  Created by Csy on 2018/11/5.
//  Copyright © 2018 Csy. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Stack

- (instancetype)init {
    if (self = [super init]) {
        _array = [NSMutableArray array];
    }
    return self;
}

- (void)push:(id)object {
    if (object == nil) {
        return;
    }
    [self.array addObject:object];
}

- (id)pop {
    id object = [self.array lastObject];
    [self.array removeLastObject];
    return object;
}

- (BOOL)isEmpty {
    return (self.array.count == 0);
}

@end
