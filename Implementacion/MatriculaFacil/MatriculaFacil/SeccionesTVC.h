//
//  SeccionesTVC.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/10/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Curso.h"
@interface SeccionesTVC : UITableViewController
{
    NSMutableArray *secciones;
    NSMutableArray *searchResults;
}
@property (nonatomic, strong) Curso *cur; 
@end
