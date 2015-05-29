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
#import "SuperJoystickScene.h"
#import "SuperThrottleScene.h"

@interface MainViewController ()

@property (nonatomic) commmands *command;

@property SKView *tView;
@property SKView *spView;

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
    
    /*
    self.rightWheelImage.image = [UIImage imageNamed:@"wheelCartoon"];
    self.leftWheelImage.image = [UIImage imageNamed:@"wheelCartoon"];
    self.rightIRSensorImage.image = [UIImage imageNamed:@"IRSensor"];
    self.middleIRSensorImage.image = [UIImage imageNamed:@"IRSensor"];
    self.leftIRSensorImage.image = [UIImage imageNamed:@"IRSensor"];
    self.carBodyImage.image = [UIImage imageNamed:@"carCartoon"];*/
    
    self.activityLogTextView.text = @"Enjoy the world! \nYou have the ability to do incredible things, controlling this vehicle included. Ingoring the cheese, be you. \n \nNo inspirational quote needed, \nyou are You, that is truer than true. There is no one alive who is Youer than You. \n\n\nCheers Dr Seuss.";

    self.commandLineTextField.delegate = self;
    self.commandLineTextField.clearsOnBeginEditing = YES;
    
    [self presentControls:0];
    
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
            if ([string isEqualToString:@"super"]) {
                [self superMainActivated];
                return nil;
            }
            else {
                self.segueIdentifier = [self.commands valueForKey:keys];
                [self performSegue];
                return self.segueIdentifier;
            }
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

- (void) superMainActivated {
    
    self.backgroundImage.image = [UIImage imageNamed:@"gradient"];
    //self.backgroundImage.alpha = 0.208367;
    self.backgroundImage.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 animations:^{self.backgroundImage.alpha = 0.208367;} completion:nil];
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.commandLineTextField.secureTextEntry = YES;
    
    self.commandLineLabel.text = @"";
    self.autoLabel.text = @"";
    [self.helpButtonLabel setTitle:@"" forState:UIControlStateNormal];
    
    [self.tView removeFromSuperview];
    [self.spView removeFromSuperview];
    
    [self presentControls:0];
}

- (void) presentControls:(NSInteger)type {
    if (type == 0) {
        // ----- Joystick
        
        int size = (self.view.frame.size.height) / 2.5;
        
        self.spView = [[SKView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame) - size, size, size)];
        [self.view addSubview:self.spView];
        
        SKScene *scene = [[MyScene alloc] initWithSize:CGSizeMake(self.spView.bounds.size.width, self.spView.bounds.size.height)];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        self.spView.allowsTransparency = YES;
        
        [self.spView presentScene:scene];
        
        // ------ Throttle
        
        self.tView = [[SKView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) - size, CGRectGetMaxY(self.view.frame) - size, size, size)];
        [self.view addSubview:self.tView];
        
        SKScene *tScene = [[ThrottleScene alloc] initWithSize:CGSizeMake(self.tView.bounds.size.width, self.tView.bounds.size.height)];
        tScene.scaleMode = SKSceneScaleModeAspectFill;
        self.tView.allowsTransparency = YES;
        
        [self.tView presentScene:tScene];
    }/*
    else if (type == 1) {
        // ----- Joystick
        
        int size = (self.view.frame.size.height) / 2.5;
        
        self.spView = [[SKView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame) - size, size, size)];
        [self.view addSubview:self.spView];
        
        SKScene *scene = [[SuperJoystickScene alloc] initWithSize:CGSizeMake(self.spView.bounds.size.width, self.spView.bounds.size.height)];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        [self.spView presentScene:scene];
        
        // ------ Throttle
        
        self.tView = [[SKView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) - size, CGRectGetMaxY(self.view.frame) - size, size, size)];
        [self.view addSubview:self.tView];
        
        SKScene *tScene = [[SuperThrottleScene alloc] initWithSize:CGSizeMake(self.tView.bounds.size.width, self.tView.bounds.size.height)];
        tScene.scaleMode = SKSceneScaleModeAspectFill;
        self.tView.allowsTransparency = YES;
        
        [self.tView presentScene:tScene];
    }*/
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
