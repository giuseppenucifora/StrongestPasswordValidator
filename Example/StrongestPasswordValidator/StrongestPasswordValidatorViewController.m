//
//  StrongestPasswordValidatorViewController.m
//  StrongestPasswordValidator
//
//  Created by Giuseppe Nucifora on 01/16/2016.
//  Copyright (c) 2016 Giuseppe Nucifora. All rights reserved.
//

#import "StrongestPasswordValidatorViewController.h"
#import "StrongestPasswordValidator.h"

@interface StrongestPasswordValidatorViewController () <UITextFieldDelegate>

@property (nonatomic, strong) StrongestPasswordValidator *validator;
@property (weak, nonatomic) IBOutlet UILabel *strenghtLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *strenghtProgress;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;


@end

@implementation StrongestPasswordValidatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _validator = [StrongestPasswordValidator sharedInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)change:(id)sender {
    
    [_validator checkPasswordStrength:[_passwordTextfield text] withBlock:^(UIColor * _Nonnull color, PasswordStrengthType strenghtType) {
        switch (strenghtType) {
            case PasswordStrengthTypeWeak: {
                [_strenghtProgress setProgress:0.33];
                [_strenghtLabel setText:@"Weak"];
                break;
            }
            case PasswordStrengthTypeModerate: {
                [_strenghtProgress setProgress:0.66];
                [_strenghtLabel setText:@"Moderate"];
                break;
            }
            case PasswordStrengthTypeStrong: {
                [_strenghtProgress setProgress:1];
                [_strenghtLabel setText:@"Strongsd"];
                break;
            }
        }
        [_strenghtProgress setTintColor:color];
    }];
}

@end
