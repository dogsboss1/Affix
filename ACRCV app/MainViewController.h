//
//  MainViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLOptionsTableViewController.h"
#import "SuperMainViewController.h"
#import "BasicHelpViewController.h"
#import "commmands.h"

#import <SpriteKit/SpriteKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate>

- (IBAction)autoActivateButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *activityLogTextView;
@property (weak, nonatomic) IBOutlet UITextField *commandLineTextField;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *cameraImage;


- (IBAction)upButtonPressed:(UIButton *)sender;
- (IBAction)BreakButtonPressed:(UIButton *)sender;
- (IBAction)speedSwitchButtonPressed:(UIButton *)sender;

- (IBAction)actionsButtonPressed:(UIButton *)sender;
- (IBAction)superMainButtonPressed:(UIButton *)sender;
- (IBAction)disconnectButtonPressed:(UIButton *)sender;

- (IBAction)commandLinePressed:(UITextField *)sender;
- (IBAction)basicHelpButtonPressed:(UIButton *)sender;
- (IBAction)gestureButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *helpButtonPressed;
- (IBAction)creditButtonPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *upButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *breakButtonLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *speedSwitchButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *autoActivatedButtonLabel;

@property (weak, nonatomic) IBOutlet UIButton *actionsButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *basicHelpButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *superMainButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *gestureButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *disconnectButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *helpButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *creditButtonLabel;

@property NSDictionary *commands;
@property NSString *segueIdentifier;
- (NSString*)commandsAction:(NSString *)string;

@property BOOL isGoingFd;

@end
