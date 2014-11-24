//
//  Seccion.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/10/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Seccion : NSObject
@property (nonatomic, strong) NSString *idSeccion;
@property (nonatomic, strong) NSString *idCurso;
@property (nonatomic, strong) NSString *codigo; 
@property (nonatomic, strong) NSString *profesor;
@property (nonatomic, strong) NSString *salon;
@property (nonatomic, strong) NSString *inicio;
@property (nonatomic, strong) NSString *fin;
@property (nonatomic, strong) NSString *tipo;
@end
