//
//  Curso.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/9/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Curso : NSObject
@property (nonatomic, strong) NSString *idCurso;
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *codigo;
@property (nonatomic, strong) NSString *creditos;
@property (nonatomic, strong) NSString *requisito;
@property (nonatomic, strong) NSString *ciclo;
@property (nonatomic, strong) NSString *estado;
@end
