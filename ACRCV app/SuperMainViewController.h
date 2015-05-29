//
//  SuperMainViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperMainViewController : UIViewController
- (IBAction)backButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
- (IBAction)colourSliderChanged:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *gradientLabel;

@end
