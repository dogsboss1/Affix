//
//  GestureRecogniserTestViewController.m
//  ACRCV app
//
//  Created by felix king on 24/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "GestureRecogniserTestViewController.h"
#import <Foundation/Foundation.h>
//#import <AVFoundation/AVFoundation.h>

@interface GestureRecogniserTestViewController ()

-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer;

@end

@implementation GestureRecogniserTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    [self.testView addGestureRecognizer:panGestureRecognizer];
    /*
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager requestWhenInUseAuthorization];*/
    
    
    /*[self.locationController.locationManager requestWhenInUseAuthorization];

    self.locationController = [[CoreLocationController alloc] init];
    self.locationController.delegate = self;
    [self.locationController.locationManager startUpdatingLocation];*/
}
/*
- (void) setupCaptureSession {
    NSError * error = nil;
    
    AVCaptureSession *captureSession;
    captureSession = [[AVCaptureSession alloc] init];
    captureSession.sessionPreset = AVCaptureSessionPresetMedium;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    [captureSession addInput:input];
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    [captureSession addOutput:output];
    
    dispatch_queue_t queue = dispatch_queue_create("myCameraOutputQueue", NULL);
    [output setSampleBufferDelegate:self queue:queue];
}
*/
/*
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error retrieving your location."delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *crnLoc = [locations lastObject];
    self.lblLongitude.text = [NSString stringWithFormat:@"Longitude: %.8f", crnLoc.coordinate.longitude];
    self.lblLatitude.text = [NSString stringWithFormat:@"Latitude: %.8f", crnLoc.coordinate.latitude];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
    }
}*/

/*
- (void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        self.mapView.showsUserLocation = YES;
    }
}*/
/*
- (void)update:(CLLocation *)location {
    self.lblLatitude.text = [NSString stringWithFormat:@"Latitude: %f", [location coordinate].latitude];
    self.lblLongitude.text = [NSString stringWithFormat:@"Longitude: %f", [location coordinate].longitude];
}

- (void)locationError:(NSError *)error {
    self.lblLatitude.text = [error description];
    self.lblLongitude.text = nil;
}*/

-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    
    self.testView.center = touchLocation;
    
    
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    
    self.horizontalVelocityLabel.text = [NSString stringWithFormat:@"Horizontal Velocity: %.2f points/sec", velocity.x];
    self.verticalVelocityLabel.text = [NSString stringWithFormat:@"Vertical Velocity: %.2f points/sec", velocity.y];
}


- (IBAction)upButtonPressed:(UIButton *)sender {
    NSLog(@"Going up");
}

- (IBAction)downButtonPressed:(UIButton *)sender {
    NSLog(@"Going down");
    
}

- (IBAction)fdButtonPressed:(UIButton *)sender {
    NSLog(@"Going forward");
    
}

- (IBAction)rightButtonPressed:(UIButton *)sender {
    NSLog(@"Going right");
    
}

- (IBAction)backButtonPressed:(UIButton *)sender {
    NSLog(@"Going back");
    
}
- (IBAction)leftButtonPressed:(UIButton *)sender {
    NSLog(@"Going left");
    
}

- (IBAction)mainMenuButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
