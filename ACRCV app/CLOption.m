//
//  CLOption.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "CLOption.h"

@implementation CLOption

- (id)init {
    self = [super init];
    if (self) {
        self.optionName = @"";
        self.completionProgress = 0.0;
        self.priority = 0;
        self.type = optionType1;
    }
    return self;
}

+ (CLOption *)optionWithName:(NSString *)name type:(optionType)type {
    CLOption* option = [[CLOption alloc] init];
    option.optionName = name;
    option.type = type;
    return option;
}

@end
