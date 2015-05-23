//
//  BasicHelp.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "BasicHelp.h"

@implementation BasicHelp

+ (instancetype)configureBasicHelpWithName:(NSString *)name
                                     image:(UIImage *)image
                                      text:(NSString *)text {
    BasicHelp* help = [[BasicHelp alloc] init];
    help.title = name;
    help.text = text;
    help.backgroundImage = image;
    return help;
}

+ (NSArray *)allBasicHelp {
    return @[[BasicHelp configureBasicHelpWithName:@"General"
                                             image:[UIImage imageNamed:@"page1.png"]
                                              text:@"This app was built for the purpose of controlling a small robot through bluetooth"],
             [BasicHelp configureBasicHelpWithName:@"Command Line"
                                             image:[UIImage imageNamed:@"page2.png"]
                                              text:@"The Command Line is for the purpose of a developer control. The idea behind iit is that once this is launched then the developer needs a one up on others."],
             [BasicHelp configureBasicHelpWithName:@"Joystick"
                                             image:[UIImage imageNamed:@"page3.png"]
                                              text:@"The Joystick controls direction of the small robot."]];
}

+ (NSInteger)quantityOfBasicHelp {
    return [self allBasicHelp].count;
}
@end
