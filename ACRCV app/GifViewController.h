//
//  GifViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GifViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *gifTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
- (IBAction)retryButtonPressed:(UIButton *)sender;

@end
