//
//  ViewController.m
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(88/225.0) blue:(38/225.0) alpha:1.0];

    
    // Create the data model
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
    _pageSubTitles = @[@"", @"", @"", @""];
    //_pageBackgroundImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    
    _pageP1 = @[@"", @"", @"", @""];
    _pageP2 = @[@"", @"", @"", @""];
    _pageP3 = @[@"", @"", @"", @""];
    _pageP4 = @[@"", @"", @"", @""];
    _pageP5 = @[@"", @"", @"", @""];
    _pageP6 = @[@"", @"", @"", @""];
    _pageP7 = @[@"", @"", @"", @""];
    _pageP8 = @[@"", @"", @"", @""];
    _pageP9 = @[@"", @"", @"", @""];
    _pageP10 = @[@"", @"", @"", @""];
    _pageP11 = @[@"", @"", @"", @""];
    _pageP12 = @[@"", @"", @"", @""];
    _pageP13 = @[@"", @"", @"", @""];
    _pageP14 = @[@"", @"", @"", @""];

    _pageMidCentreImages = @[@"", @"", @"", @""];
    _pageLeftTopImages = @[@"", @"", @"", @""];
    _pageLeftMidImages = @[@"", @"", @"", @""];
    _pageLeftBottomImages = @[@"", @"", @"", @""];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.backgroundimages = self.pageBackgroundImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.subTitleText = self.pageSubTitles[index];
    
    pageContentViewController.p1 = self.pageP1[index];
    pageContentViewController.p2 = self.pageP2[index];
    pageContentViewController.p3 = self.pageP3[index];
    pageContentViewController.p4 = self.pageP4[index];
    pageContentViewController.p5 = self.pageP5[index];
    pageContentViewController.p6 = self.pageP6[index];
    pageContentViewController.p7 = self.pageP7[index];
    pageContentViewController.p8 = self.pageP8[index];
    pageContentViewController.p9 = self.pageP9[index];
    pageContentViewController.p10 = self.pageP10[index];
    pageContentViewController.p11 = self.pageP11[index];
    pageContentViewController.p12 = self.pageP12[index];
    pageContentViewController.p13 = self.pageP13[index];
    pageContentViewController.p14 = self.pageP14[index];

    pageContentViewController.midCentreImages = self.pageMidCentreImages[index];
    pageContentViewController.leftTopImages = self.pageLeftTopImages[index];
    pageContentViewController.leftMidImages = self.pageLeftMidImages[index];
    pageContentViewController.leftBottomImages = self.pageLeftBottomImages[index];

    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)startWalkThrough:(UIButton *)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionReverse
                                       animated:NO
                                     completion:nil];
}


@end
