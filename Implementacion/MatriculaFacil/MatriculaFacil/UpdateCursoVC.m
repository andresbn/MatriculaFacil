//
//  UpdateCursoVC.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/9/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "UpdateCursoVC.h"

@interface UpdateCursoVC ()

@end

@implementation UpdateCursoVC

@synthesize cur,tap,NombreTxt,CodigoTxt,CodigoLbl,CreditosTxt,CreditosLbl,RequisitoTxt,RequisitoLbl,CicloTxt,CicloLbl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigation];
    [self initializeControls];
    NSLog(@"%@",cur.nombre);
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
    
    NombreTxt.text = cur.nombre;
    CodigoTxt.text = cur.codigo;
    CreditosTxt.text = cur.creditos;
    RequisitoTxt.text = cur.requisito;
    CicloTxt.text = cur.ciclo;
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
    title2.text = @"Curso";
    title2.textColor = [UIColor redColor];
    title2.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title2];
    
    self.navigationItem.titleView = container;
}
- (IBAction)ActualizarCurso:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextfield Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    
    //    if (textField.tag == 200) {
    //
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [CodigoLbl setFrame:CGRectMake(45, 161, 99, 46)];
        [CodigoTxt setFrame:CGRectMake(45, 207, 230, 30)];
        [CreditosLbl setFrame:CGRectMake(45, 235, 122, 46)];
        [CreditosTxt setFrame:CGRectMake(45, 278, 230, 30)];
        [RequisitoLbl setFrame:CGRectMake(45, 306, 99, 46)];
        [RequisitoTxt setFrame:CGRectMake(45, 349, 230, 30)];
        [CicloLbl setFrame:CGRectMake(45, 379, 99, 46)];
        [CicloTxt setFrame:CGRectMake(45, 423, 230, 30)];
    } completion:^(BOOL finished) {
        
    }];
    //    }
    
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    tap.enabled = YES;
    
    if (textField.tag == 100 || textField.tag == 200) {
        
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [CodigoLbl setFrame:CGRectMake(-230, 161, 99, 46)];
            [CodigoTxt setFrame:CGRectMake(-230, 207, 230, 30)];
            [CreditosLbl setFrame:CGRectMake(330, 235, 122, 46)];
            [CreditosTxt setFrame:CGRectMake(330, 278, 230, 30)];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                [RequisitoLbl setFrame:CGRectMake(45, 161, 99, 46)];
                [RequisitoTxt setFrame:CGRectMake(45, 207, 230, 30)];
                [CicloLbl setFrame:CGRectMake(45, 235, 99, 46)];
                [CicloTxt setFrame:CGRectMake(45, 278, 230, 30)];
            } completion:^(BOOL finished) {
                
            }];
            
        }];
        
        
        
    }
    
    
    
    return YES;
}
-(void)hideKeyboard
{
    [NombreTxt resignFirstResponder];
    [CodigoTxt resignFirstResponder];
    [CreditosTxt resignFirstResponder];
    [RequisitoTxt resignFirstResponder];
    [CicloTxt resignFirstResponder];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [CodigoLbl setFrame:CGRectMake(45, 161, 99, 46)];
        [CodigoTxt setFrame:CGRectMake(45, 207, 230, 30)];
        [CreditosLbl setFrame:CGRectMake(45, 235, 122, 46)];
        [CreditosTxt setFrame:CGRectMake(45, 278, 230, 30)];
        [RequisitoLbl setFrame:CGRectMake(45, 306, 99, 46)];
        [RequisitoTxt setFrame:CGRectMake(45, 349, 230, 30)];
        [CicloLbl setFrame:CGRectMake(45, 379, 99, 46)];
        [CicloTxt setFrame:CGRectMake(45, 423, 230, 30)];
    } completion:^(BOOL finished) {
        
    }];
    
    tap.enabled = NO;
    
}

@end
