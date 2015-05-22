//
//  CLOptionsCell.h
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLOptionsCell : UITableViewCell
- (IBAction)activateActionButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *priotityStepperLabel;
@property (weak, nonatomic) IBOutlet UIStepper *priorityStepper;
@property (weak, nonatomic) IBOutlet UIProgressView *actionProgressProgressView;
@property (weak, nonatomic) IBOutlet UILabel *actionNameLabel;

@end
