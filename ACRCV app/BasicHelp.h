//
//  BasicHelp.h
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BasicHelp : NSObject

@property NSString* title;
@property NSString* text;
@property UIImage * backgroundImage;

+ (NSArray *)allBasicHelp;
+ (NSInteger)quantityOfBasicHelp;

@end
