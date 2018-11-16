//
//  main.m
//  NumericString
//
//  Created by Csy on 2018/11/15.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

bool isNumeric(const char* str);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char *str1 = "123.45e+6";
        char *str2 = "12e+5.4";
        bool result1 = isNumeric(str1);
        bool result2 = isNumeric(str2);
    }
    return 0;
}

bool scanUnsignedInteger(const char** str) {
    const char *start = *str;
    while ((**str != '\0') && (**str >= '0') && (**str <= '9') ) {
        (*str)++;
    }
    return *str > start;
}

bool scanInteger(const char** str) {
    if ((**str == '+') || (**str == '-')) {
        (*str)++;
    }
    return scanUnsignedInteger(str);
}

bool isNumeric(const char* str) {
    if (str == NULL) {
        return false;
    }
    bool isNumeric = scanInteger(&str);
    
    if(*str == '.') {
        ++str;
        // 必须要先扫描后面的结果，再和前面的做对比
        isNumeric = scanUnsignedInteger(&str) || isNumeric;
    }
    
    if(*str == 'e' || *str == 'E') {
        ++str;
        isNumeric = isNumeric && scanInteger(&str);
    }
    
    return isNumeric && (*str == '\0');
}
