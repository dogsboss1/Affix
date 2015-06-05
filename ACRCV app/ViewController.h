//
//  ViewController.h
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageSubTitles;

@property (strong, nonatomic) NSArray *pageP1;
@property (strong, nonatomic) NSArray *pageP2;
@property (strong, nonatomic) NSArray *pageP3;
@property (strong, nonatomic) NSArray *pageP4;
@property (strong, nonatomic) NSArray *pageP5;
@property (strong, nonatomic) NSArray *pageP6;
@property (strong, nonatomic) NSArray *pageP7;
@property (strong, nonatomic) NSArray *pageP8;
@property (strong, nonatomic) NSArray *pageP9;
@property (strong, nonatomic) NSArray *pageP10;
@property (strong, nonatomic) NSArray *pageP11;
@property (strong, nonatomic) NSArray *pageP12;
@property (strong, nonatomic) NSArray *pageP13;
@property (strong, nonatomic) NSArray *pageP14;

@property (strong, nonatomic) NSArray *pageBackgroundImages;
@property (strong, nonatomic) NSArray *pageMidCentreImages;;
@property (strong, nonatomic) NSArray *pageLeftTopImages;
@property (strong, nonatomic) NSArray *pageLeftMidImages;
@property (strong, nonatomic) NSArray *pageLeftBottomImages;


- (IBAction)startWalkThrough:(UIButton *)sender;


@end

