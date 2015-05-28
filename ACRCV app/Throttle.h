//
//  Throttle.h
//  ACRCV app
//
//  Created by felix king on 28/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Throttle : SKNode {
    SKSpriteNode *thumbNode;
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
+ (id) throttleWithThumb:(SKSpriteNode *)aNode;
- (id) initWithThumb:(SKSpriteNode *)backgroundNode andNode:(SKSpriteNode*)thumbNode;
+ (id) throttleWithThumb:(SKSpriteNode *)backgroundNode andNode:(SKSpriteNode *)thumbNode;

@end
