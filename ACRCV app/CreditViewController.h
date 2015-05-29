//
//  CreditViewController.h
//  ACRCV app
//
//  Created by felix king on 29/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButtonLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UITextView *creditTextView;
@property (weak, nonatomic) IBOutlet UILabel *developerLabel;

- (IBAction)backButtonPressed:(UIButton *)sender;

@end
