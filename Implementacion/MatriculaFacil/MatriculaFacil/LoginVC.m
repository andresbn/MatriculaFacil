//
//  LoginVC.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/8/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "LoginVC.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginVC ()

@end

@implementation LoginVC

@synthesize LoginBtn,UsuarioLbl,UsuarioTxt,PasswordLbl,PasswordTxt,tap;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeControls];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initializeControls
{
    LoginBtn.layer.cornerRadius = 5;
    LoginBtn.clipsToBounds = YES;
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    tap.enabled = NO;
    [self.view addGestureRecognizer:tap];
}
- (IBAction)LoginAction:(id)sender {
    
    
    if ([UsuarioTxt.text isEqualToString:@"ianache"] && [PasswordTxt.text isEqualToString:@"1234"]) {
        
        [self performSegueWithIdentifier:@"LoginAdminSuccess" sender:self];
    }
    
    if ([UsuarioTxt.text isEqualToString:@"aherrera"] && [PasswordTxt.text isEqualToString:@"1234"]) {
        
        [self performSegueWithIdentifier:@"LoginUserSuccess" sender:self];
    }
}

#pragma mark - UITextfield Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    
//    if (textField.tag == 200) {
//        
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [UsuarioTxt setFrame:CGRectMake(52, 274, 217, 30)];
            [UsuarioLbl setFrame:CGRectMake(52, 237, 79, 36)];
            [PasswordTxt setFrame:CGRectMake(52, 341, 217, 30)];
            [PasswordLbl setFrame:CGRectMake(52, 305, 79, 36)];
            
        } completion:^(BOOL finished) {
            
        }];
//    }
    
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    tap.enabled = YES;
    
//    if (textField.tag == 200) {
    
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [UsuarioTxt setFrame:CGRectMake(52, 204, 217, 30)];
            [UsuarioLbl setFrame:CGRectMake(52, 167, 79, 36)];
            [PasswordTxt setFrame:CGRectMake(52, 271, 217, 30)];
            [PasswordLbl setFrame:CGRectMake(52, 235, 79, 36)];
            
        } completion:^(BOOL finished) {
            
        }];
//    }
    

    
    return YES;
}
-(void)hideKeyboard
{
    [UsuarioTxt resignFirstResponder];
    [PasswordTxt resignFirstResponder];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [UsuarioTxt setFrame:CGRectMake(52, 274, 217, 30)];
        [UsuarioLbl setFrame:CGRectMake(52, 237, 79, 36)];
        [PasswordTxt setFrame:CGRectMake(52, 341, 217, 30)];
        [PasswordLbl setFrame:CGRectMake(52, 305, 79, 36)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    tap.enabled = NO;
    
}
@end
