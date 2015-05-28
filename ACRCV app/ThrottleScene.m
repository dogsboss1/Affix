//
//  ThrottleScene.m
//  ACRCV app
//
//  Created by felix king on 28/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "ThrottleScene.h"
#import "Throttle.h"

@interface ThrottleScene ()

@property Throttle* throttle;

@property CGPoint throttlePosition;
@property CGFloat zRoation;

@property SKSpriteNode* carNode;
@property SKSpriteNode* background;

@property CGPoint middlePoint;

@end

@implementation ThrottleScene

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        
        
        CADisplayLink *velocityTick = [CADisplayLink displayLinkWithTarget:self selector:@selector(throttleMovement)];
        [velocityTick addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        self.scene.backgroundColor = [UIColor clearColor];
        
        //   self.middlePoint = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        /*  self.background = [SKSpriteNode spriteNodeWithImageNamed:@"red-cross.png"];
         self.background.position = self.middlePoint;
         self.background.size = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
         self.background.alpha = 0.1;
         [self addChild:self.background];*/
        
        [self addThrottle];
        [self addNonCar];
        
    }
    return self;
}

- (void) addThrottle {
    SKSpriteNode *thThumb = [SKSpriteNode spriteNodeWithImageNamed:@"Throttle nob"];
    SKSpriteNode *thBackdrop = [SKSpriteNode spriteNodeWithImageNamed:@"Throttle V2"];
    self.throttle = [Throttle throttleWithThumb:thThumb andBackDrop:thBackdrop];
    self.throttle.position = CGPointMake(thBackdrop.size.width, thBackdrop.size.height);
    [self addChild:self.throttle];
}

- (void) throttleMovement {
    if (self.throttle.velocity.x !=0) {
        self.carNode.position = CGPointMake(/*self.carNode.position.x + .1 * self.throttle.velocity.x*/ 50 , self.carNode.position.y + .1 * self.throttle.velocity.y);
        self.carNode.zRotation = self.throttle.angularVelocity;
    }
}

- (void) addNonCar {
    self.carNode = [SKSpriteNode spriteNodeWithImageNamed:@"red-cross"];
    self.carNode.position = CGPointMake(250, 200);
    self.carNode.size = CGSizeMake(128, 32);
    self.carNode.name = @"nonCarNode";
    [self addChild:self.carNode];
}

@end
