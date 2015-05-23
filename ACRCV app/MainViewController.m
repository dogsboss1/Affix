//
//  MainViewController.m
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic) commmands *command;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.commandLineTextField.delegate = self;
    

    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        //NSString *commandText = [components lastObject];
        NSLog(@"return pressed");
#warning check for what command was pressed

        //textView.text = @"";
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}*/

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

- (NSString*) commandsAction:(NSString *)string {
    
    self.commands = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"superSegue", @"optionsSegue", nil] forKeys:[NSArray arrayWithObjects:@"super", @"options", nil]];
    
    for (NSString *keys in [self.commands allKeys]) {
        if ([string isEqualToString:keys]) {
            self.segueIdentifier = [self.commands valueForKey:keys];
            [self performSegue];
            return self.segueIdentifier;
        }
    }
    if ([self.segueIdentifier isEqualToString:@""]) {
        return nil;
    }
    else {
        return nil;
    }
    
}

- (void) performSegue {
    [self performSelector:@selector(welcomeBack) withObject:self afterDelay:0.3];
    [self performSegueWithIdentifier:self.segueIdentifier sender:self];
}

- (void) welcomeBack {
    self.commandLineLabel.text = @"Welcome Back!";
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

- (IBAction)commandLinePressed:(UITextField *)sender {
    NSLog(@"command line actovity");
}

- (IBAction)commandLineGoButtonPressed:(UIButton *)sender {
    
    NSString* input = self.commandLineTextField.text;
    
    self.commandLineLabel.text = input;
    
    [self commandsAction:input];
    
    self.commandLineTextField.text = @"";
    
    
}

@end
