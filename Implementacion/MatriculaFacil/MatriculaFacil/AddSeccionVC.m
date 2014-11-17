//
//  AddSeccionVC.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/10/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "AddSeccionVC.h"

@interface AddSeccionVC ()

@end

@implementation AddSeccionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) customNavigation
{

    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
    container.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.topItem.title = @" ";
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(-9, -3, 170, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"Crear";
    title.textColor = [UIColor redColor];
    title.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title];
    
    UILabel *title2 = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, 170, 40)];
    title2.textAlignment = NSTextAlignmentCenter;
    title2.text = @"Sección";
    title2.textColor = [UIColor redColor];
    title2.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title2];
    
    self.navigationItem.titleView = container;
}

@end
