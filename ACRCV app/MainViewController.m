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
#import "Joystick.h"

@interface MainViewController ()

@property (nonatomic) commmands *command;
@property (nonatomic) Joystick *joystick;

@property SKView *tView;
@property SKView *spView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isGoingFd = YES;
    [self updateImages];
    
    [self noWords];
    
    NSString *log = @"Enjoy the world! \nYou have the ability to do incredible things, controlling this vehicle included. Ingoring the cheese, be you. \n \nNo inspirational quote needed, \nyou are You, that is truer than true. There is no one alive who is Youer than You. \n\n\nCheers Dr Seuss.";
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:log];
    NSUInteger _stringLength = [log length];
    
    UIColor *green = [UIColor greenColor];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:13.0];
    [attrString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _stringLength)];
    [attrString addAttribute:NSForegroundColorAttributeName value:green range:NSMakeRange(0, _stringLength)];
    
    self.activityLogTextView.attributedText = attrString;

    self.commandLineTextField.delegate = self;
    self.commandLineTextField.clearsOnBeginEditing = YES;
    
    [self presentControls:0];
}

- (void) updateImages {
    if (self.isGoingFd == NO) {
        [self.speedSwitchButtonLabel setImage:[UIImage imageNamed:@"REV"]forState:UIControlStateNormal];
    }
    else {
        [self.speedSwitchButtonLabel setImage:[UIImage imageNamed:@"FWD"]forState:UIControlStateNormal];
    }
    [self.autoActivatedButtonLabel setImage:[UIImage imageNamed:@"Button"] forState:UIControlStateNormal];
    [self.autoActivatedButtonLabel setImage:[UIImage imageNamed:@"Button pushed down"] forState:UIControlStateHighlighted];
}

- (void) noWords {
    [self.actionsButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.basicHelpButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.superMainButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.gestureButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.disconnectButtonLabel setTitle:@"" forState:UIControlStateNormal];
    [self.creditButtonLabel setTitle:@"" forState:UIControlStateNormal];
    
    self.fdLabel.text = @"";
    self.breakLabel.text = @"";
    self.speedlabel.text = @"";
    self.autoLabel.text = @"";
    self.degreesLabel.text = @"";
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
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:(@"superSegue")]) {
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
}*/

- (NSString*) commandsAction:(NSString *)string {
    self.commands = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"superSegue", @"optionsSegue", @"BasicHelpSegue", @"disconnected",@"testingSegue", @"creditSegue", nil] forKeys:[NSArray arrayWithObjects:@"super", @"options", @"help", @"disconnect", @"gesture", @"credit", nil]];
    
    for (NSString *keys in [self.commands allKeys]) {
        if ([string isEqualToString:keys]) {
            if ([string isEqualToString:@"super"]) {
                [self superMainActivated];
                return nil;
            }
            else if ([string isEqualToString:@"disconnect"]) {
                [self didDisconnect];
                return nil;
            }
            else {
                self.segueIdentifier = [self.commands valueForKey:keys];
                [self performSegue];
                return self.segueIdentifier;
            }
        }
    }
    return nil;
}

- (void) didDisconnect {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Disconnection!" message:@"You have been disconnected from bluetooth." delegate:self cancelButtonTitle:@"Why?" otherButtonTitles:@"Retry", nil];
    
    [alert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (buttonIndex == 0) {
        [self performSegueWithIdentifier:@"BasicHelpSegue" sender:self];
    }
}

- (void) superMainActivated {
    
    self.backgroundImage.image = [UIImage imageNamed:@"gradient"];
    //self.backgroundImage.alpha = 0.208367;
    self.backgroundImage.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 animations:^{self.backgroundImage.alpha = 0.068027;} completion:nil];
    self.view.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(88/255.0) blue:(38/255.0) alpha:1.0];
    
    self.commandLineTextField.secureTextEntry = YES;
    
    [self.helpButtonLabel setTitle:@"" forState:UIControlStateNormal];
    
    [self.tView removeFromSuperview];
    [self.spView removeFromSuperview];
    
    [self presentControls:0];
}


- (void) presentControls:(NSInteger)type {
    if (type == 0) {
        // ----- Joystick
        
        int size = (self.view.frame.size.height) / 3.15;
        
        self.spView = [[SKView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame) - size, size, size)];
        [self.view addSubview:self.spView];
        
        SKScene *scene = [[MyScene alloc] initWithSize:CGSizeMake(self.spView.bounds.size.width, self.spView.bounds.size.height)];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        self.spView.allowsTransparency = YES;
        
        //self.degreesLabel.text = [NSString stringWithFormat:@"%f", self.joystick.angularVelocity];
        
        [self.spView presentScene:scene];
        
        // ------ Throttle
        /*
        self.tView = [[SKView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) - size, CGRectGetMaxY(self.view.frame) - size, size, size)];
        [self.view addSubview:self.tView];
        
        SKScene *tScene = [[ThrottleScene alloc] initWithSize:CGSizeMake(self.tView.bounds.size.width, self.tView.bounds.size.height)];
        tScene.scaleMode = SKSceneScaleModeAspectFill;
        self.tView.allowsTransparency = YES;
        
        [self.tView presentScene:tScene];*/
    }
}

- (BOOL) changeBool:(BOOL)abool {
    if (abool == YES) {
        return NO;
    }
    else {
        return YES;
    }
}

- (void) moving {
    if (self.isGoingFd == NO) {
        self.fdLabel.text = @"REV";
    }
    else {
        self.fdLabel.text = @"FD";
    }
}

- (void) notMoving {
    self.fdLabel.text = @"";
}

- (void) breaking {
    self.breakLabel.text = @"Break";
}

- (void) notBreaking {
    self.breakLabel.text = @"";
}

- (void) performSegue {
    [self performSelector:@selector(welcomeBack) withObject:self afterDelay:0.3];
    [self performSegueWithIdentifier:self.segueIdentifier sender:self];
}

- (void) welcomeBack {
    self.commandLineTextField.text = @"";
}

// ========================================================================= //
#pragma mark Buttons
// ========================================================================= //

- (IBAction)autoActivateButtonPressed:(UIButton *)sender {
    NSLog(@"Auto activated");
    [self didDisconnect];
}

- (IBAction)upButtonPressed:(UIButton *)sender {
    [self moving];
    //NSLog(@"Going up");
}

- (IBAction)BreakButtonPressed:(UIButton *)sender {
    //NSLog(@"Going down");
    [self breaking];
}

- (IBAction)speedSwitchButtonPressed:(UIButton *)sender {
    self.isGoingFd = [self changeBool:self.isGoingFd];
    [self updateImages];
    NSLog(self.isGoingFd ? @"Yes" : @"No");
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

- (IBAction)basicHelpButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"BasicHelpSegue" sender:self];
}

- (IBAction)gestureButtonPressed:(UIButton *)sender {
}

- (IBAction)creditButtonPressed:(UIButton *)sender {
}

- (IBAction)upButtonUnPressed:(UIButton *)sender {
    NSLog(@"Button unpressed");
    [self notMoving];
}

- (IBAction)breakButtonUnPressed:(UIButton *)sender {
    NSLog(@"Button break Unpresed");
    [self notBreaking];
}


@end
