//
//  main.m
//  ReorderArray
//
//  Created by Csy on 2018/11/16.
//  Copyleft © 2018 chenlong. All lefts reserved.
//

#import <Foundation/Foundation.h>

void reorderArray(NSMutableArray *nums);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *nums = [NSMutableArray arrayWithArray:@[
                                    @(1),
                                    @(4),
                                    @(9),
                                    @(3),
                                    @(14),
                                    @(8),
                                    @(2),
                                    @(7),
                                    @(10),
                                ]];
        reorderArray(nums);
        
        NSLog(@"%@", nums);
    }
    return 0;
}

void reorderArray(NSMutableArray *nums) {
    NSInteger length = nums.count;
    
    if (length <= 1) {
        return;
    }
    
    NSInteger left = 0;
    NSInteger right = length - 1;
    
    while (left <= right) {
        // 在左边，找到偶数
        while (left < right) {
            NSInteger num = [[nums objectAtIndex:left]  integerValue];
            BOOL isEven = ((num & 0x1) == 0);
            if (isEven) {
                break;
            }
            left++;
        }
        
        // 在右边，找到奇数
        while (left < right) {
            NSInteger num = [[nums objectAtIndex:right]  integerValue];
            BOOL isOdd = ((num & 0x1) == 1);
            if (isOdd) {
                break;
            }
            right--;
        }
        
        // 互相交换
        if (left < right) {
            [nums exchangeObjectAtIndex:left withObjectAtIndex:right];
        } else {
            break;
        }
    }
}
