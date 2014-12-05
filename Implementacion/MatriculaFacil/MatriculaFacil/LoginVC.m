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

@synthesize LoginBtn,UsuarioTxt,PasswordTxt,tap,image;

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
    
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        image.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    } completion:^(BOOL finished) {
        
    }];
    
    
    image.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
    
    [UIView animateWithDuration:0.3 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        image.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    } completion:^(BOOL finished) {
       
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            image.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.4, 1.4);
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                image.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
            } completion:^(BOOL finished) {
                
            }];
        }];
        
    }];
    
    LoginBtn.layer.cornerRadius = 5;
    LoginBtn.clipsToBounds = YES;
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    tap.enabled = NO;
    [self.view addGestureRecognizer:tap];
    
    
    UsuarioTxt.text = @"ianache";
    PasswordTxt.text = @"1234";
    
//    UsuarioTxt.text = @"aherrera";
//    PasswordTxt.text = @"1234";
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"delete_text.png"] forState:UIControlStateNormal];
//    [button setFrame:CGRectMake(0.0f, 0.0f, 16.0f, 16.0f)]; // Required for iOS7
//    UsuarioTxt.rightView = button;
//    UsuarioTxt.rightViewMode = UITextFieldViewModeWhileEditing;
//    PasswordTxt.rightView = button;
//    PasswordTxt.rightViewMode = UITextFieldViewModeWhileEditing;
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
            
//            [UsuarioTxt setFrame:CGRectMake(52, 274, 217, 30)];
//            [UsuarioLbl setFrame:CGRectMake(52, 237, 79, 36)];
//            [PasswordTxt setFrame:CGRectMake(52, 341, 217, 30)];
//            [PasswordLbl setFrame:CGRectMake(52, 305, 79, 36)];
            
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
            
//            [UsuarioTxt setFrame:CGRectMake(52, 204, 217, 30)];
//            [UsuarioLbl setFrame:CGRectMake(52, 167, 79, 36)];
//            [PasswordTxt setFrame:CGRectMake(52, 271, 217, 30)];
//            [PasswordLbl setFrame:CGRectMake(52, 235, 79, 36)];
            
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
        
//        [UsuarioTxt setFrame:CGRectMake(52, 274, 217, 30)];
//        [UsuarioLbl setFrame:CGRectMake(52, 237, 79, 36)];
//        [PasswordTxt setFrame:CGRectMake(52, 341, 217, 30)];
//        [PasswordLbl setFrame:CGRectMake(52, 305, 79, 36)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    tap.enabled = NO;
    
}
@end
