//
//  commmands.h
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommandLineWhichSegueDelegate <NSObject>

@property NSString* segueName;

@end

@interface commmands : NSObject

@property NSDictionary *commands;
@property NSString *segueIdentifier;

- (NSString*)commandsAction:(NSString *)string;

@end
