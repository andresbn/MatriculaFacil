//
//  UpdateSeccionVC.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/17/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "UpdateSeccionVC.h"

@interface UpdateSeccionVC ()

@end

@implementation UpdateSeccionVC

@synthesize tap,CodigoLbl,CodigoTxt,ProfesorLbl,ProfesorTxt,SalonLbl,SalonTxt,InicioLbl,InicioTxt,FinLbl,FinTxt,TipoLbl,TipoTxt,sec;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeControls];
    [self customNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initializeControls
{
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    tap.enabled = NO;
    [self.view addGestureRecognizer:tap];
    
    CodigoTxt.text = sec.codigo;
    ProfesorTxt.text = sec.profesor;
    SalonTxt.text = sec.salon;
    InicioTxt.text = sec.inicio;
    FinTxt.text = sec.fin;
    TipoTxt.text = sec.tipo;
}
-(void) customNavigation
{
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
    container.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.topItem.title = @" ";
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(-9, -3, 170, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"Actualizar";
    title.textColor = [UIColor redColor];
    title.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title];
    
    UILabel *title2 = [[UILabel alloc]initWithFrame:CGRectMake(18, 11, 170, 40)];
    title2.textAlignment = NSTextAlignmentCenter;
    title2.text = @"Sección";
    title2.textColor = [UIColor redColor];
    title2.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title2];
    
    self.navigationItem.titleView = container;
}
- (IBAction)ActualizarSeccion:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark - UITextfield Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [CodigoLbl setFrame:CGRectMake(45, 75, 110, 46)];
        [CodigoTxt setFrame:CGRectMake(45, 112, 230, 30)];
        [ProfesorLbl setFrame:CGRectMake(45, 140, 110, 46)];
        [ProfesorTxt setFrame:CGRectMake(45, 186, 230, 30)];
        [SalonLbl setFrame:CGRectMake(45, 214, 110, 46)];
        [SalonTxt setFrame:CGRectMake(45, 257, 230, 30)];
        [InicioLbl setFrame:CGRectMake(45, 285, 110, 46)];
        [InicioTxt setFrame:CGRectMake(45, 328, 230, 30)];
        [FinLbl setFrame:CGRectMake(45, 358, 110, 46)];
        [FinTxt setFrame:CGRectMake(45, 402, 230, 30)];
        [TipoLbl setFrame:CGRectMake(45, 430, 110, 46)];
        [TipoTxt setFrame:CGRectMake(45, 474, 230, 30)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    tap.enabled = YES;
    
    if (textField.tag == 100 || textField.tag == 200 || textField.tag == 300) {
        
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            
            [CodigoLbl setFrame:CGRectMake(-230, 75, 110, 46)];
            [CodigoTxt setFrame:CGRectMake(-230, 112, 230, 30)];
            [ProfesorLbl setFrame:CGRectMake(330, 140, 110, 46)];
            [ProfesorTxt setFrame:CGRectMake(330, 186, 230, 30)];
            [SalonLbl setFrame:CGRectMake(-230, 214, 110, 46)];
            [SalonTxt setFrame:CGRectMake(-230, 257, 230, 30)];
            
            
            
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                [InicioLbl setFrame:CGRectMake(45, 75, 110, 46)];
                [InicioTxt setFrame:CGRectMake(45, 112, 230, 30)];
                [FinLbl setFrame:CGRectMake(45, 140, 110, 46)];
                [FinTxt setFrame:CGRectMake(45, 186, 230, 30)];
                [TipoLbl setFrame:CGRectMake(45, 214, 110, 46)];
                [TipoTxt setFrame:CGRectMake(45, 257, 230, 30)];
                
                
            } completion:^(BOOL finished) {
                
            }];
            
        }];
        
        
        
    }
    return YES;
}
-(void)hideKeyboard
{
    [CodigoTxt resignFirstResponder];
    [ProfesorTxt resignFirstResponder];
    [SalonTxt resignFirstResponder];
    [InicioTxt resignFirstResponder];
    [FinTxt resignFirstResponder];
    [TipoTxt resignFirstResponder];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [CodigoLbl setFrame:CGRectMake(45, 75, 110, 46)];
        [CodigoTxt setFrame:CGRectMake(45, 112, 230, 30)];
        [ProfesorLbl setFrame:CGRectMake(45, 140, 110, 46)];
        [ProfesorTxt setFrame:CGRectMake(45, 186, 230, 30)];
        [SalonLbl setFrame:CGRectMake(45, 214, 110, 46)];
        [SalonTxt setFrame:CGRectMake(45, 257, 230, 30)];
        [InicioLbl setFrame:CGRectMake(45, 285, 110, 46)];
        [InicioTxt setFrame:CGRectMake(45, 328, 230, 30)];
        [FinLbl setFrame:CGRectMake(45, 358, 110, 46)];
        [FinTxt setFrame:CGRectMake(45, 402, 230, 30)];
        [TipoLbl setFrame:CGRectMake(45, 430, 110, 46)];
        [TipoTxt setFrame:CGRectMake(45, 474, 230, 30)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    tap.enabled = NO;
    
}
@end
