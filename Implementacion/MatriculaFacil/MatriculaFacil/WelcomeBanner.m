//
//  WelcomeBanner.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/9/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "WelcomeBanner.h"

@interface WelcomeBanner ()

@end

@implementation WelcomeBanner

@synthesize UserName,Mode;

- (void)viewDidLoad {
    [super viewDidLoad];
    UserName.alpha = 0.0;
    Mode.alpha = 0.0;
    UserName.frame = CGRectMake(-200, 14, 288, 25);
    Mode.frame = CGRectMake(330, 44, 288, 25);
    [self initializeControls];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeControls
{
    NSString *welcome = [NSString stringWithFormat:@"Bienvenido %@",@"Ilver Anache"];
    UserName.text = welcome;
    
    
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        
        UserName.alpha = 1.0;
        Mode.alpha = 1.0;
        UserName.frame = CGRectMake(16, 14, 288, 25);
        Mode.frame = CGRectMake(16, 44, 288, 25);
        
    } completion:^(BOOL finished) {
        
    }];
}

@end
