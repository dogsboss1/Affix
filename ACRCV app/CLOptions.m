//
//  CLOptions.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "CLOptions.h"

@implementation CLOptions

- (NSMutableArray *)allOptions {
    if (!_allOptions) {
        _allOptions = [[NSMutableArray alloc] init];
        
        [_allOptions addObject:[CLOption makeOptionOfType:optionType1]];
        [_allOptions addObject:[CLOption makeOptionOfType:optionType2]];
        [_allOptions addObject:[CLOption makeOptionOfType:optionType3]];
        [_allOptions addObject:[CLOption makeOptionOfType:optionType4]];
        [_allOptions addObject:[CLOption makeOptionOfType:optionType5]];

    }
    return _allOptions;
}
@end
