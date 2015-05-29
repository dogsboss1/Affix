//
//  CreditViewController.m
//  ACRCV app
//
//  Created by felix king on 29/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "CreditViewController.h"

@implementation CreditViewController

- (void)viewDidLoad {
    self.titleLabel.text = @"Special thanks";
    self.backgroundImage.image = [UIImage imageNamed:@"Finished"];
    
    NSString *credit = @"Ryan Martin -- A great friend and a dedicated pixel destroyer.\n\nDaniel Budd -- The safty net for when forums don't work.\n\nAlex Shearer -- The CS-GO master.\n\nJan Honnens -- Help, every single day.\n\nPatrick Louden -- The reality checker.\n\n...and of course Mum King -- Her dedication and love knows no bounds.";
    self.creditTextView.text = [NSString stringWithFormat:@"%@", credit];
}

- (IBAction)backButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
