
//
//  SuperJoystickScene.m
//  ACRCV app
//
//  Created by felix king on 29/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "SuperJoystickScene.h"
#import "Joystick.h"

@interface SuperJoystickScene ()

@property Joystick* joystick;

@property CGPoint joystickPosition;
@property CGFloat zRoation;

@property SKSpriteNode* carNode;
@property SKSpriteNode* background;

@property CGPoint middlePoint;

@end

@implementation SuperJoystickScene

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        
        
        CADisplayLink *velocityTick = [CADisplayLink displayLinkWithTarget:self selector:@selector(joystickMovement)];
        [velocityTick addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        self.scene.backgroundColor = [UIColor redColor];
        
        //   self.middlePoint = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        /*  self.background = [SKSpriteNode spriteNodeWithImageNamed:@"red-cross.png"];
         self.background.position = self.middlePoint;
         self.background.size = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
         self.background.alpha = 0.1;
         [self addChild:self.background];*/
        
        self.scene.backgroundColor = [UIColor redColor];
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"gradient"];
        background.position = CGPointMake(self.scene.size.width, self.scene.size.height);
        background.size = self.scene.size;
        background.alpha = 0.406463;
        
        [self addChild:background];
        [self addJoystick];
        [self addCar];
        
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
        //self.carNode.position = CGPointMake(self.carNode.position.x + .1 * self.joystick.velocity.x, self.carNode.position.y + .1 * self.joystick.velocity.y);
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