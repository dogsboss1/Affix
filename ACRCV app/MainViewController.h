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

@interface MainViewController : UIViewController //<UITextViewDelegate>
- (IBAction)autoActivateButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *commandLineLabel;
@property (weak, nonatomic) IBOutlet UITextView *activityLogTextView;
@property (weak, nonatomic) IBOutlet UIImageView *rightSideBarImage;
@property (weak, nonatomic) IBOutlet UITextField *commandLineTextField;

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

@property NSDictionary* commands;

@end
