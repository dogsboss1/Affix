//
//  MainViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoLongerConnectedViewController.h"
#import "CLOptionsTableViewController.h"
#import "SuperMainViewController.h"
#import "BasicHelpViewController.h"
#import "commmands.h"

#import <SpriteKit/SpriteKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate>

- (IBAction)autoActivateButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *commandLineLabel;
@property (weak, nonatomic) IBOutlet UITextView *activityLogTextView;
@property (weak, nonatomic) IBOutlet UITextField *commandLineTextField;
@property (weak, nonatomic) IBOutlet UILabel *autoLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

- (IBAction)upButtonPressed:(UIButton *)sender;
- (IBAction)downButtonPressed:(UIButton *)sender;
- (IBAction)fdButtonPressed:(UIButton *)sender;
- (IBAction)rightButtonPressed:(UIButton *)sender;
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)leftButtonPressed:(UIButton *)sender;

- (IBAction)actionsButtonPressed:(UIButton *)sender;
- (IBAction)superMainButtonPressed:(UIButton *)sender;
- (IBAction)disconnectButtonPressed:(UIButton *)sender;

- (IBAction)commandLinePressed:(UITextField *)sender;
- (IBAction)commandLineGoButtonPressed:(UIButton *)sender;
- (IBAction)basicHelpButtonPressed:(UIButton *)sender;
- (IBAction)gestureButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *helpButtonPressed;

@property (weak, nonatomic) IBOutlet UIButton *rightButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *upButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *downButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *fdButtonLabel;

@property (weak, nonatomic) IBOutlet UIButton *actionsButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *basicHelpButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *superMainButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *gestureButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *disconnectButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *helpButtonLabel;

@property (weak, nonatomic) IBOutlet UIImageView *rightWheelImage;
@property (weak, nonatomic) IBOutlet UIImageView *leftWheelImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightIRSensorImage;
@property (weak, nonatomic) IBOutlet UIImageView *middleIRSensorImage;
@property (weak, nonatomic) IBOutlet UIImageView *leftIRSensorImage;
@property (weak, nonatomic) IBOutlet UIImageView *carBodyImage;


@property NSDictionary *commands;
@property NSString *segueIdentifier;
- (NSString*)commandsAction:(NSString *)string;

@end
