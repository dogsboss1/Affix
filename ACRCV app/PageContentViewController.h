//
//  PageContentViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midCentreImage;
@property (weak, nonatomic) IBOutlet UIImageView *leftTopImage;
@property (weak, nonatomic) IBOutlet UIImageView *leftMidImage;
@property (weak, nonatomic) IBOutlet UIImageView *leftBottomImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *p1Label;
@property (weak, nonatomic) IBOutlet UILabel *p2Label;
@property (weak, nonatomic) IBOutlet UILabel *p3Label;
@property (weak, nonatomic) IBOutlet UILabel *p4Label;
@property (weak, nonatomic) IBOutlet UILabel *p5Label;
@property (weak, nonatomic) IBOutlet UILabel *p6Label;
@property (weak, nonatomic) IBOutlet UILabel *p7Label;
@property (weak, nonatomic) IBOutlet UILabel *p8Label;
@property (weak, nonatomic) IBOutlet UILabel *p9Label;
@property (weak, nonatomic) IBOutlet UILabel *p10Label;
@property (weak, nonatomic) IBOutlet UILabel *p11Label;
@property (weak, nonatomic) IBOutlet UILabel *p12Label;
@property (weak, nonatomic) IBOutlet UILabel *p13Label;
@property (weak, nonatomic) IBOutlet UILabel *p14Label;

@property NSUInteger pageIndex;

@property NSString *titleText;
@property NSString *subTitleText;

@property NSString *p1;
@property NSString *p2;
@property NSString *p3;
@property NSString *p4;
@property NSString *p5;
@property NSString *p6;
@property NSString *p7;
@property NSString *p8;
@property NSString *p9;
@property NSString *p10;
@property NSString *p11;
@property NSString *p12;
@property NSString *p13;
@property NSString *p14;

@property NSString *backgroundimages;
@property NSString *midCentreImages;
@property NSString *leftTopImages;
@property NSString *leftMidImages;
@property NSString *leftBottomImages;

- (IBAction)bluetoothButtonPressed:(UIButton *)sender;


@end
