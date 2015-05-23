//
//  CLOptionsTableViewController.m
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "CLOptionsTableViewController.h"
#import "CLOption.h"
#import "CLOptions.h"
#import "CLOptionsCell.h"

@interface CLOptionsTableViewController ()

@property (nonatomic)CLOptions *options;

@end

@implementation CLOptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (CLOptions *)options {
    if (!_options) {
        _options =[[CLOptions alloc] init];
        [_options optionOfType:[CLOption optionWithName:@"360" type:optionType1]];
    }
    return _options;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.options optionOfType:section].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *optionOfType = [self.options optionOfType:[indexPath indexAtPosition:0]];
    CLOption *option = [optionOfType objectAtIndex:[indexPath indexAtPosition:1]];
    
    CLOptionsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"actionCell"];
    cell.actionNameLabel.text = option.optionName;
    cell.actionProgressProgressView.progress = option.completionProgress;
    cell.priotityStepperLabel.text = [NSString stringWithFormat:@"%d", (int)option.priority];
    
    return cell;
}

- (UITableView *)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Available Actions";
    }
    else {
        return @"No Longer Available Actions";
    }
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
@end
