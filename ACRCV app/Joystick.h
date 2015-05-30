//
//  Joystick.h
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Joystick : SKNode {
    SKSpriteNode *thumbNode;
    SKSpriteNode *backgroundNode;
    BOOL isTracking;
    CGPoint velocity;
    CGPoint travelLimit;
    float angularVelocity;
    float size;
}

@property (nonatomic, readonly) CGPoint velocity;
@property (nonatomic, readonly) float angularVelocity;
@property (nonatomic, readonly) float size;

- (id) initWithThumb:(SKSpriteNode *)aNode;
+ (id) joystickWithThumb:(SKSpriteNode *)aNode;
- (id) initWithThumb:(SKSpriteNode *)thumbNode andBackDrop:(SKSpriteNode*)backgroundNode;
+ (id) joystickWithThumb:(SKSpriteNode *)thumbNode andBackDrop:(SKSpriteNode *)backgroundNode;

@end
