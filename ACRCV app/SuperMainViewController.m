//
//  SuperMainViewController.m
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "SuperMainViewController.h"

@interface SuperMainViewController ()

@end

@implementation SuperMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backgroundImage.image = [UIImage imageNamed:@"gradient"];
    self.backgroundImage.alpha = 1.0;
    
    self.view.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(88/255.0) blue:(38/255.0) alpha:1.0];
    // Do any additional setup after loading the view.
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


- (IBAction)backButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)colourSliderChanged:(UISlider *)sender {
    self.backgroundImage.alpha = self.slider.value;
    self.gradientLabel.text = [NSString stringWithFormat:@"Alpha: %f", self.slider.value];
}
@end
