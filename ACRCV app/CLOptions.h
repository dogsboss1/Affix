//
//  CLOptions.h
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLOption.h"

@interface CLOptions : NSObject

@property (nonatomic) NSMutableArray* allOptions;

- (NSArray *) optionOfType:(optionType)type;

@end
