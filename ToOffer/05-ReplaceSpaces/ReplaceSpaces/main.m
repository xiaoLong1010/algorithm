//
//  main.m
//  ReplaceSpaces
//
//  Created by Csy on 2018/11/4.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

void ReplaceBlank(char str[], NSInteger length);
void CatArray(NSInteger first[], NSInteger length1, NSInteger second[], NSInteger length2);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char str[] = "this is OK";
        ReplaceBlank(str, 10);
        NSLog(@"%s",str);
        
        NSInteger first[100] = {1,2,4,6,7,9,10};
        NSInteger second[] = {3,5,8,19};
        CatArray(first, 7, second, 4);
        NSLog(@"cat array end");
    }
    return 0;
}

void ReplaceBlank(char str[], NSInteger length) {
    if (str == NULL || length <= 0) {
        return;
    }
    
    // find the num of blank
    NSInteger numOfBlank = 0;
    for (NSInteger index = 0; index < length; index++) {
        if (str[index] == ' ') {
            numOfBlank++;
        }
    }
    
    // calculate the new length
    NSInteger newLength = length + 2 * numOfBlank;
    
    // use two indexes, copy the word from leftIndex to rightIndex
    // if find blank,use'%20'
    NSInteger leftIndex = length;
    NSInteger rightIndex = newLength;
    while (leftIndex >= 0 && leftIndex < rightIndex) {
        if (str[leftIndex] == ' ') {
            str[rightIndex--] = '0';
            str[rightIndex--] = '2';
            str[rightIndex--] = '%';
        } else {
            str[rightIndex--] = str[leftIndex];
        }
        leftIndex--;
    }
}

void CatArray(NSInteger first[], NSInteger length1, NSInteger second[], NSInteger length2) {
    // 异常判断
    
    // caclute the total
    NSInteger totalLength = length1 + length2;
    
    // use three indexes.
    // firstRightIndex ,firstLeftIndex,secondIndex
    NSInteger firstLeftIndex = length1 - 1;
    NSInteger firstRightIndex = totalLength - 1;
    NSInteger secondIndex = length2 - 1;
    
    while (firstRightIndex >= 0 ) {
        if (firstLeftIndex >= 0 && secondIndex >= 0) {
            if (first[firstLeftIndex] > second[secondIndex]) {
                first[firstRightIndex] = first[firstLeftIndex];
                firstLeftIndex--;
            } else {
                first[firstRightIndex] = second[secondIndex];
                secondIndex--;
            }
            firstRightIndex--;
        } else if (firstLeftIndex >= 0) {
            first[firstRightIndex] = first[firstLeftIndex];
            firstLeftIndex--;
            firstRightIndex--;
        } else if (secondIndex >= 0) {
            first[firstRightIndex] = second[secondIndex];
            secondIndex--;
            firstRightIndex--;
        }
    }
}


