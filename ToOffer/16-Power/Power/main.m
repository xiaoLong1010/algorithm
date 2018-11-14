//
//  main.m
//  Power
//
//  Created by Csy on 2018/11/12.
//  Copyright © 2018 Csy. All rights reserved.
//

#import <Foundation/Foundation.h>

double power(double base, int exponent);
double powerWithUnsignedExponent(double base, unsigned int exponent);
double power(double base, int exponent);
bool equal(double num1, double num2);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double test1 = power(1.0, 4);
        double test2 = power(2.1, 4);
    }
    return 0;
}

double power(double base, int exponent) {
    if (equal(base, 0.0) && exponent < 0) {
        return 0.0;
    }
    
    unsigned int absExponent = exponent;
    if (exponent < 0) {
        absExponent = (-exponent);
    }
    
    
    double result = powerWithUnsignedExponent(base, absExponent);
    if (exponent < 0) {
        result = 1.0 / result;
    }
    
    return result;
}

double powerWithUnsignedExponent(double base, unsigned int exponent) {
    double result = 1.0;
    while (exponent > 0) {
        result *= base;
        exponent--;
    }
    return result;
}

double powerWithUnsignedExponent2(double base, unsigned int exponent) {
    if (exponent == 0) {
        return 1.0;
    }
    
    if (exponent == 1) {
        return base;
    }
    
    // 右移运算，代替除以2.
    double halfResult = powerWithUnsignedExponent2(base, exponent>>1);
    double result = halfResult * halfResult;
    
    // 奇次方。位与运算判断是奇数还是偶数，代替求余运算%
    if ((exponent & 0x1) == 1) {
        result *= base;
    }
    return result;
}


bool equal(double num1, double num2) {
    if ((num1 - num2 > -0.0000001) && (num1 - num2 < 0.0000001))
        return true;
    else
        return false;
}
