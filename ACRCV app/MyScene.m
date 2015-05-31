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
@property (nonatomic) MainViewController * mainMenu;

@property CGPoint joystickPosition;
@property CGFloat zRoation;

@property SKSpriteNode* carNode;
@property SKSpriteNode *bgNode;
@property SKSpriteNode* background;

@property CGPoint middlePoint;

@property NSInteger wheelSize;

@end

@implementation MyScene

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        CADisplayLink *velocityTick = [CADisplayLink displayLinkWithTarget:self selector:@selector(joystickMovement)];
        [velocityTick addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        self.scene.backgroundColor = [UIColor clearColor];
        
        self.wheelSize = 100;
        
        [self addJoystick];
        //[self addCar];
        [self addbackgroundWheel];
        
    }
    return self;
}

- (void) addJoystick {
    SKSpriteNode *jsThumb = [SKSpriteNode spriteNodeWithImageNamed:@"200x200 box"];
    SKSpriteNode *jsBackdrop = [SKSpriteNode spriteNodeWithImageNamed:@"200x200 box"];
    jsBackdrop.size = CGSizeMake(self.wheelSize, self.wheelSize);
    jsThumb.size = CGSizeMake(80, 80);
    self.joystick = [Joystick joystickWithThumb:jsThumb andBackDrop:jsBackdrop];
    self.joystick.position = CGPointMake(jsBackdrop.size.width, jsBackdrop.size.height);
    [self addChild:self.joystick];
}

- (void) joystickMovement {
    if (self.joystick.velocity.x !=0 || self.joystick.velocity.y != 0) {
        //self.carNode.position = CGPointMake(self.carNode.position.x + .1 * self.joystick.velocity.x, self.carNode.position.y + .1 * self.joystick.velocity.y);
        self.carNode.zRotation = self.joystick.angularVelocity;
        self.bgNode.zRotation = self.joystick.angularVelocity;
        //self.mainMenu.degreesLabel.text = [NSString stringWithFormat:@"%f", self.joystick.angularVelocity];
        //self.mainMenu.degreesLabel.text = @"--";
        NSLog(@"%f", self.joystick.angularVelocity);
    }
}

- (void) addCar {
    self.carNode = [SKSpriteNode spriteNodeWithImageNamed:@"green-tick"];
    self.carNode.position = CGPointMake(250, 200);
    self.carNode.size = CGSizeMake(128, 32);
    self.carNode.name = @"carNode";
    [self addChild:self.carNode];
}

- (void) addbackgroundWheel {
    self.bgNode = [SKSpriteNode spriteNodeWithImageNamed:@"Wheel"];
    self.bgNode.position = CGPointMake(self.wheelSize, self.wheelSize);
    self.bgNode.size = CGSizeMake(150, 150);
    self.bgNode.name = @"bgNode";
    [self addChild:self.bgNode];
}

@end
