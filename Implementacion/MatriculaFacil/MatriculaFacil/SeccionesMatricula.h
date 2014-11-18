//
//  SeccionesMatricula.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/17/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Curso.h"

@interface SeccionesMatricula : UITableViewController<UIActionSheetDelegate>
{
    NSMutableArray *secciones;

}
@property (nonatomic, strong) Curso *cur;
@end
