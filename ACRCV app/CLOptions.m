//
//  CLOptions.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "CLOptions.h"

@implementation CLOptions

- (instancetype) init {
    self = [super init];
    if (self) {
        self.allOptions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)optionOfType:(optionType)type {
    NSMutableArray *optionsOfType = [[NSMutableArray alloc] init];
    for (CLOption *option in self.allOptions) {
        if (option.type == type) {
            [optionsOfType addObject:option];
        }
    }
    return optionsOfType;
}
@end
