//
//  CLOptionsCell.m
//  ACRCV app
//
//  Created by felix king on 23/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "CLOptionsCell.h"

@implementation CLOptionsCell

- (IBAction)activateActionButtonPressed:(UIButton *)sender {
    self.actiavteButtonLabel.enabled = NO;
#warning Possibility of an attributed string
    /*
    UIColor *_redColour = [UIColor redColor];
    NSDictionary *attrsDic = [NSDictionary dictionaryWithObjects: forKeys:NSFontAttributeName];
    
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"Activated" attributes:attrsDic];
    self.activatedLabel.attributedText = attrString;*/
    self.activatedLabel.text = @"Activated";
    self.completeLabel.text = @"";
    
    [self progressTimer];
}
- (IBAction)actionPriorityStepperPressed:(UIStepper *)sender {
    double value = [sender value];
    
    UIStepper *stepper = (UIStepper *)sender;
    
    stepper.maximumValue = 10;
    stepper.minimumValue = 0;
    
    [self.priotityStepperLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
    
}

- (void) progressTimer {
    self.actionProgressProgressView.progress = 0;
    self.num = 0;
    
    self.progressNum = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(progressActon) userInfo:nil repeats:YES];
    
}

- (void) progressActon {
    self.num ++;
    if (self.num == 11) {
        [self.progressNum invalidate];
        [self performSelector:@selector(progressFin) withObject:self afterDelay:0.7];
    } else {
        self.actionProgressProgressView.progress += 0.1;
    }
}

- (void) progressFin {
    self.actiavteButtonLabel.enabled = YES;
    self.completeLabel.text = @"Complete";
    self.activatedLabel.text = @"";
}

@end
