//
//  MainViewController.m
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        _commands = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"superSegue", @"optionsSegue", nil] forKeys:[NSArray arrayWithObjects:@"super", @"options", nil]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:(@"disconnectedSegue")]) {
        // Get the new view controller using [segue destinationViewController].
        NoLongerConnectedViewController *disconnectVC = [segue destinationViewController];
        // Pass the selected object to the new view controller.
    }
    else if ([[segue identifier] isEqualToString:(@"superSegue")]) {
        // Get the new view controller using [segue destinationViewController].
        SuperMainViewController *superVC = [segue destinationViewController];
        // Pass the selected object to the new view controller.
    }

    else if ([[segue identifier] isEqualToString:(@"optionsSegue")]) {
        // Get the new view controller using [segue destinationViewController].
        CLOptionsTableViewController *optionsVC = [segue destinationViewController];
        // Pass the selected object to the new view controller.
    }

    
}



- (IBAction)autoActivateButtonPressed:(UIButton *)sender {
    
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

- (IBAction)actionsButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"optionsSegue" sender:self];

}

- (IBAction)superMainButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"superSegue" sender:self];

}

- (IBAction)disconnectButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"disconnectedSegue" sender:self];

}

@end
