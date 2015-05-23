//
//  CLOption.h
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, optionType) {
    optionType1,
    optionType2,
    optionType3,
    optionType4,
    
};

@interface CLOption : NSObject

+ (instancetype) makeOptionOfType:(optionType)type;

@property NSString *optionName;

@property NSString *whoGotCredit;

@end
