//
//  SimpleInfoViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *simpleInfoTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *simpleInfoTextView;
- (IBAction)retryBluetoothButtonPressed:(UIButton *)sender;
- (IBAction)giveUpButtonPressed:(UIButton *)sender;


@end
