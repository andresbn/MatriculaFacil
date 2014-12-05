//
//  AddSeccionVC.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/10/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectionManager.h"

@interface AddSeccionVC : UIViewController<UITextFieldDelegate>
{
    ConnectionManager *manager;
}
@property (weak, nonatomic) IBOutlet UILabel *CodigoLbl;
@property (weak, nonatomic) IBOutlet UITextField *CodigoTxt;
@property (weak, nonatomic) IBOutlet UILabel *ProfesorLbl;
@property (weak, nonatomic) IBOutlet UITextField *ProfesorTxt;
@property (weak, nonatomic) IBOutlet UILabel *SalonLbl;
@property (weak, nonatomic) IBOutlet UITextField *SalonTxt;
@property (weak, nonatomic) IBOutlet UILabel *InicioLbl;
@property (weak, nonatomic) IBOutlet UITextField *InicioTxt;
@property (weak, nonatomic) IBOutlet UILabel *FinLbl;
@property (weak, nonatomic) IBOutlet UITextField *FinTxt;
@property (weak, nonatomic) IBOutlet UILabel *TipoLbl;
@property (weak, nonatomic) IBOutlet UITextField *TipoTxt;
@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end
