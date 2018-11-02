//
//  main.m
//  DuplicationInArray
//
//  Created by Csy on 2018/11/2.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger duplication(NSInteger numbers[], NSInteger length);
void testDuplication(void);
NSInteger countInRange(NSInteger numbers[], NSInteger length, NSInteger start, NSInteger end);
NSInteger duplication2(NSInteger numbers[], NSInteger length);
void testDublication2(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testDuplication();
        testDublication2();
    }
    return 0;
}

void testDuplication() {
    NSInteger length = 6;
    NSInteger nums[] = {2,3,5,1,0,4};
    NSInteger resut = duplication(nums, length);
    if (resut == -1) {
        NSLog(@"no duplication");
    } else {
        NSLog(@"duplication");
    }
}

void testDublication2() {
    NSInteger length = 8;
    NSInteger nums[] = {2,2,5,4,3,2,6,7};
    NSInteger resut = duplication2(nums, length);
    if (resut == -1) {
        NSLog(@"no duplication2");
    } else {
        NSLog(@"duplication2");
    }
}

/**
 计算数组重复的数字
 @return -1，表示没有重复；
 */
NSInteger duplication(NSInteger numbers[], NSInteger length) {
    // 异常判断
    if (numbers == NULL || length < 0 ) {
        return -1;
    }
    
    // 数组内的值必须小于length
    for (NSInteger index = 0; index < length; index++) {
        NSInteger value = numbers[index];
        if (value < 0 || value >= length) {
            return -1;
        }
    }
    
    for (NSInteger index = 0; index < length; index++) {
        // 一定要把index这个值放到对应的index下标处
        while (numbers[index] != index) {
            // left是index位置的值
            // right是numbers[index]位置的值
            if (numbers[index] == numbers[numbers[index]]) {
                return numbers[index];
            }
            
            // 交换
            // 保证numbers[index]下标对应的值是numbers[index]
            NSInteger temp = numbers[index];
            numbers[index] = numbers[temp];
            numbers[temp] = temp;
        }
    }
    
    return -1;
}


/**
 长度为n+1的数组，只能存放1-n的数，求重复的一个数

 @param numbers 数组
 @param length 数组长度
 @return 重复的数字
 */
NSInteger duplication2(NSInteger numbers[], NSInteger length) {
    
    NSInteger start = 1;
    NSInteger end = length - 1;
    while (start <= end) {
        NSInteger mid = start + ((end - start)>>1);
        NSInteger count = countInRange(numbers, length, start, mid);
        
        if (start == end) {
            if (count > 1) {
                return start;
            } else {
                break;
            }
        }
        
        // 数量超出，则重复的数字在左边
        // 否则，看看右边是否有重复的数字
        if (count > (mid - start + 1)) {
            end = mid;
        } else {
            start = mid + 1;
        }
    }
    
    return -1;
}


/**
 [start end]区间的数字，在数组出现了多少次

 @param numbers 数组
 @param length 数组长度
 @param start 开始值
 @param end 结束值
 @return 在区间的数字，如果大于(end-start+1),那就说明这个区间有重复数字
 */
NSInteger countInRange(NSInteger numbers[], NSInteger length, NSInteger start, NSInteger end) {
    // 异常判断
    if (numbers == NULL) {
        return -1;
    }
    NSInteger count = 0;
    
    // 计算在[start, end]这个区间的数字，在数组中出现的次数
    // 如果大于(end-start+1),那就说明这个区间有重复数字
    for (NSInteger index = 0; index < length; index++) {
        NSInteger value = numbers[index];
        if (value >= start && value <=end) {
            count++;
        }
    }
    return count;
}
