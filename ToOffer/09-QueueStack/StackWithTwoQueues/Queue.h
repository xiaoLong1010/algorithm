//
//  Queue.h
//  StackWithTwoQueues
//
//  Created by Csy on 2018/11/5.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject

- (void)enqueue:(id)object;
- (id)dequeue;
- (BOOL)isEmpty;
- (NSInteger)count;

@end

NS_ASSUME_NONNULL_END
