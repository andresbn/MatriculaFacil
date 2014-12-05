//
//  LoginVC.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/8/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *LoginBtn;
@property (strong, nonatomic) IBOutlet UITextField *UsuarioTxt;
@property (strong, nonatomic) IBOutlet UITextField *PasswordTxt;
@property (strong, nonatomic) UITapGestureRecognizer *tap;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@end
