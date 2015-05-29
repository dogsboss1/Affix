//
//  CoreLocation.h
//  ACRCV app
//
//  Created by felix king on 29/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
/*
@protocol CoreLocationControllerDelegate
- (void)update:(CLLocation *)location;
- (void)locationError:(NSError *)error;
@end*/

@interface CoreLocationController : NSObject //<CLLocationManagerDelegate>
/*
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) id delegate;*/

@end
