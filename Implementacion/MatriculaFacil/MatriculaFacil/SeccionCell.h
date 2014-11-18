//
//  SeccionCell.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/10/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeccionCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *codigo;
@property (strong, nonatomic) IBOutlet UILabel *profesor;
@property (strong, nonatomic) IBOutlet UILabel *salon;
@property (strong, nonatomic) IBOutlet UILabel *inicio;
@property (strong, nonatomic) IBOutlet UILabel *fin;
@property (strong, nonatomic) IBOutlet UILabel *tipo;


@end
