//
//  GestureRecogniserTestViewController.h
//  ACRCV app
//
//  Created by felix king on 24/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CoreLocationController.h"

@interface GestureRecogniserTestViewController : UIViewController <CoreLocationControllerDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) CoreLocationController *locationController;

@property (weak, nonatomic) IBOutlet UIView *testView;

@property (weak, nonatomic) IBOutlet UILabel *horizontalVelocityLabel;

@property (weak, nonatomic) IBOutlet UILabel *verticalVelocityLabel;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *lblLongitude;
@property (weak, nonatomic) IBOutlet UILabel *lblLatitude;



- (IBAction)upButtonPressed:(UIButton *)sender;
- (IBAction)downButtonPressed:(UIButton *)sender;
- (IBAction)fdButtonPressed:(UIButton *)sender;
- (IBAction)rightButtonPressed:(UIButton *)sender;
- (IBAction)backButtonPressed:(UIButton *)sender;
- (IBAction)leftButtonPressed:(UIButton *)sender;

- (IBAction)mainMenuButtonPressed:(UIButton *)sender;

@end
