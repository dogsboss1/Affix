//
//  MyScene.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "MyScene.h"
#import "Joystick.h"
#import "MainViewController.h"

@interface MyScene ()

@property Joystick* joystick;

@property CGPoint joystickPosition;
@property CGFloat zRoation;

@property SKSpriteNode* carNode;


@property CGPoint middlePoint;

@end

@implementation MyScene

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        [self addJoystick];
        [self addCar];
        
        CADisplayLink *velocityTick = [CADisplayLink displayLinkWithTarget:self selector:@selector(joystickMovement)];
        [velocityTick addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        
        
        self.middlePoint = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
    }
    return self;
}

- (void) addJoystick {
    SKSpriteNode *jsThumb = [SKSpriteNode spriteNodeWithImageNamed:@"joystick"];
    SKSpriteNode *jsBackdrop = [SKSpriteNode spriteNodeWithImageNamed:@"dpad"];
    self.joystick = [Joystick joystickWithThumb:jsThumb andBackDrop:jsBackdrop];
    self.joystick.position = CGPointMake(jsBackdrop.size.width, jsBackdrop.size.height);
    [self addChild:self.joystick];
}

- (void) joystickMovement {
    if (self.joystick.velocity.x !=0 || self.joystick.velocity.y != 0) {
        self.carNode.position = CGPointMake(self.carNode.position.x + .1 * self.joystick.velocity.x, self.carNode.position.y + .1 * self.joystick.velocity.y);
        self.carNode.zRotation = self.joystick.angularVelocity;
    }
}

- (void) addCar {
    self.carNode = [SKSpriteNode spriteNodeWithImageNamed:@"green-tick"];
    self.carNode.position = CGPointMake(250, 200);
    self.carNode.size = CGSizeMake(128, 32);
    self.carNode.name = @"carNode";
    [self addChild:self.carNode];
}

@end
