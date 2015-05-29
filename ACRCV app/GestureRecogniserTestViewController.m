//
//  GestureRecogniserTestViewController.m
//  ACRCV app
//
//  Created by felix king on 24/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "GestureRecogniserTestViewController.h"
#import <Foundation/Foundation.h>

@interface GestureRecogniserTestViewController ()

-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer;

@end

@implementation GestureRecogniserTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    [self.testView addGestureRecognizer:panGestureRecognizer];
    
    self.locationController = [[CoreLocationController alloc] init];
    self.locationController.delegate = self;
    [self.locationController.locationManager startUpdatingLocation];
}


- (void)update:(CLLocation *)location {
    self.lblLatitude.text = [NSString stringWithFormat:@"Latitude: %f", [location coordinate].latitude];
    self.lblLongitude.text = [NSString stringWithFormat:@"Longitude: %f", [location coordinate].longitude];
}

- (void)locationError:(NSError *)error {
    self.lblLatitude.text = [error description];
    self.lblLongitude.text = nil;
}

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
