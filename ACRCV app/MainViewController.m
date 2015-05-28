//
//  MainViewController.m
//  ACRCV app
//
//  Created by felix king on 22/05/2015.
//  Copyright (c) 2015 Felix King. All rights reserved.
//

#import "MainViewController.h"
#import "MyScene.h"
#import "ThrottleScene.h"

@interface MainViewController ()

@property (nonatomic) commmands *command;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rightButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.backButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.leftButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.upButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.downButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.fdButtonLabel setTitle:@"" forState:UIControlStateNormal];
    
    [self.actionsButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.basicHelpButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.superMainButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.gestureButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.disconnectButtonLabel setTitle:@"" forState:UIControlStateNormal];
    
    self.rightWheelImage.image = [UIImage imageNamed:@"wheelCartoon"];
    self.leftWheelImage.image = [UIImage imageNamed:@"wheelCartoon"];
    self.rightIRSensorImage.image = [UIImage imageNamed:@"IRSensor"];
    self.middleIRSensorImage.image = [UIImage imageNamed:@"IRSensor"];
    self.leftIRSensorImage.image = [UIImage imageNamed:@"IRSensor"];
    self.carBodyImage.image = [UIImage imageNamed:@"carCartoon"];

    self.commandLineTextField.delegate = self;
    self.commandLineTextField.clearsOnBeginEditing = YES;
    
    // ----- Joystick
    
    int size = (self.view.frame.size.height) / 2.5;
    
    SKView *spView = [[SKView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame) - size, size, size)];
    [self.view addSubview:spView];
    
    SKScene *scene = [[MyScene alloc] initWithSize:CGSizeMake(spView.bounds.size.width, spView.bounds.size.height)];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    spView.allowsTransparency = YES;
    
    [spView presentScene:scene];
    
    // ------ Throttle
    
    
    SKView *tView = [[SKView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) - size, CGRectGetMaxY(self.view.frame) - size, size, size)];
    [self.view addSubview:tView];
    
    SKScene *tScene = [[ThrottleScene alloc] initWithSize:CGSizeMake(tView.bounds.size.width, tView.bounds.size.height)];
    tScene.scaleMode = SKSceneScaleModeAspectFill;
    tView.allowsTransparency = YES;
    
    [tView presentScene:tScene];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self commandsAction:self.commandLineTextField.text];
    
    if (textField == self.commandLineTextField) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
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
    else if ([[segue identifier] isEqualToString:(@"basicHelpSegue")]) {
        // Get the new view controller using [segue destinationViewController].
        BasicHelpViewController *basicHelpVC = [segue destinationViewController];
        // Pass the selected object to the new view controller.
    }
}


- (NSString*) commandsAction:(NSString *)string {
    self.commandLineLabel.text = self.commandLineTextField.text;
    
    self.commands = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"superSegue", @"optionsSegue", @"BasicHelpSegue", @"disconnectedSegue", nil] forKeys:[NSArray arrayWithObjects:@"super", @"options", @"help", @"disconnect", nil]];
    
    for (NSString *keys in [self.commands allKeys]) {
        if ([string isEqualToString:keys]) {
            self.segueIdentifier = [self.commands valueForKey:keys];
            [self performSegue];
            return self.segueIdentifier;
        }
    }
    self.commandLineTextField.text = @"";
    if ([self.segueIdentifier isEqualToString:@""]) {
        return nil;
    }
    else {
        return nil;
    }
    
}

- (void) autoEngaged {
    
}

- (void) performSegue {
    self.commandLineLabel.text = @"";
    [self autoEngaged];
    [self performSelector:@selector(welcomeBack) withObject:self afterDelay:0.3];
    [self performSegueWithIdentifier:self.segueIdentifier sender:self];
}

- (void) welcomeBack {
    self.commandLineLabel.text = @"Welcome Back!";
    self.commandLineTextField.text = @"";
}

- (IBAction)autoActivateButtonPressed:(UIButton *)sender {
    NSLog(@"Auto activated");
    [self autoEngaged];
    
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
    [self commandsAction:self.commandLineTextField.text];
    [self.commandLineTextField resignFirstResponder];
}

- (IBAction)basicHelpButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"BasicHelpSegue" sender:self];
}

- (IBAction)gestureButtonPressed:(UIButton *)sender {
}

@end
