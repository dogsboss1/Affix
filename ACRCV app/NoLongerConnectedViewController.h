//
//  NoLongerConnectedViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoLongerConnectedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *noLongerConnectedTitleLabel;

- (IBAction)retryButtonPressed:(UIButton *)sender;
- (IBAction)whyDidThisHappenButtonPressed:(UIButton *)sender;
- (IBAction)iKnowButtonPressed:(UIButton *)sender;

@end
