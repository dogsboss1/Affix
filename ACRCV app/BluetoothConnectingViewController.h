//
//  BluetoothConnectingViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BluetoothConnectingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *pairDevicesTitleLabel;

- (IBAction)mainVCButtonPressed:(UIButton *)sender;
- (IBAction)centralManagerVC:(UIButton *)sender;
- (IBAction)PeripheralVC:(UIButton *)sender;

@end
