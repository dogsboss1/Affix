//
//  CLOption.h
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, optionType) {
    optionType1,
    optionType2,
    
};

@interface CLOption : NSObject

+ (CLOption *)optionWithName:(NSString *)name type:(optionType)type;

@property optionType type;
@property NSString* optionName;
@property CGFloat completionProgress;
@property NSInteger priority;


@end
