//
//  CLOption.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "CLOption.h"

@implementation CLOption

+ (instancetype)makeOptionOfType:(optionType)type {
    CLOption *option = [[CLOption alloc] init];
    
    if (type == optionType1) {
        option.optionName = @"360";
        option.completionProgress = arc4random_uniform(100)/100.0;
        option.priority = 0;
    }
    else if (type == optionType2) {
        option.optionName = @"360";
        option.completionProgress = arc4random_uniform(100)/100.0;
        option.priority = 0;
    }
    else if (type == optionType3) {
        option.optionName = @"360";
        option.completionProgress = arc4random_uniform(100)/100.0;
        option.priority = 0;
    }
    else if (type == optionType4) {
        option.optionName = @"360";
        option.completionProgress = arc4random_uniform(100)/100.0;
        option.priority = 0;
    }
    else if (type == optionType5) {
        option.optionName = @"360";
        option.completionProgress = arc4random_uniform(100)/100.0;
        option.priority = 0;
    }
    return option;
}

@end
