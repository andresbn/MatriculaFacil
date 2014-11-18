//
//  HomeCell.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/17/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *curso;
@property (strong, nonatomic) IBOutlet UILabel *codigo;
@property (strong, nonatomic) IBOutlet UISwitch *estado;

@end
