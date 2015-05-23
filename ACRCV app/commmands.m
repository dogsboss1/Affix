//
//  commmands.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "commmands.h"

@implementation commmands

- (NSString*) commandsAction:(NSString *)string {
    
    self.commands = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"superSegue", @"optionsSegue", nil] forKeys:[NSArray arrayWithObjects:@"super", @"options", nil]];
    
    NSLog(@"%@", self.commands);
    
    for (NSString *keys in [self.commands allKeys]) {
        NSLog(@"%@", keys);
        if (string == keys) {
            self.segueIdentifier = [self.commands valueForKey:keys];
        }
    }
    return self.segueIdentifier;
}
@end
