//
//  PageContentViewController.m
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(88/225.0) blue:(38/225.0) alpha:1.0];
    self.backgroundImageView.image = [UIImage imageNamed:@"gradient"];//[UIImage imageNamed:self.backgroundimages];
    self.backgroundImageView.alpha = 0.068027;
    self.midCentreImage.image = [UIImage imageNamed:self.midCentreImages];
    
    self.leftTopImage.image = [UIImage imageNamed:self.leftTopImages];
    self.leftMidImage.image = [UIImage imageNamed:self.leftMidImages];
    self.leftBottomImage.image = [UIImage imageNamed:self.leftBottomImages];

    self.titleLabel.text = self.titleText;
    self.subTitleLabel.text = self.subTitleText;
    
    self.p1Label.text = self.p1;
    self.p2Label.text = self.p2;
    self.p3Label.text = self.p3;
    self.p4Label.text = self.p4;
    self.p5Label.text = self.p5;
    self.p6Label.text = self.p6;
    self.p7Label.text = self.p7;
    self.p8Label.text = self.p8;
    self.p9Label.text = self.p9;
    self.p10Label.text = self.p10;
    self.p11Label.text = self.p11;
    self.p12Label.text = self.p12;
    self.p13Label.text = self.p13;
    self.p14Label.text = self.p14;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bluetoothButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"homeSegue" sender:self];
}

@end
