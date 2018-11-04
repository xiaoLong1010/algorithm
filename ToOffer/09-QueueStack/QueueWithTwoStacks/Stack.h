//
//  Stack.h
//  QueueWithTwoStacks
//
//  Created by Csy on 2018/11/5.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject

- (void)push:(id)object;
- (id)pop;
- (BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END
