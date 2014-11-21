//
//  UpdateCursoVC.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/9/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Curso.h"
#import "ConnectionManager.h"

@interface UpdateCursoVC : UIViewController<UITextFieldDelegate>
{
    ConnectionManager *manager;
}
@property (nonatomic, strong) Curso *cur;
@property (strong, nonatomic) IBOutlet UITextField *NombreTxt;
@property (strong, nonatomic) IBOutlet UILabel *CodigoLbl;
@property (strong, nonatomic) IBOutlet UITextField *CodigoTxt;
@property (strong, nonatomic) IBOutlet UILabel *CreditosLbl;
@property (strong, nonatomic) IBOutlet UITextField *CreditosTxt;
@property (strong, nonatomic) IBOutlet UILabel *RequisitoLbl;
@property (strong, nonatomic) IBOutlet UITextField *RequisitoTxt;
@property (strong, nonatomic) IBOutlet UILabel *CicloLbl;
@property (strong, nonatomic) IBOutlet UITextField *CicloTxt;
@property (strong, nonatomic) UITapGestureRecognizer *tap;
@end
