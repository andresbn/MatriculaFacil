//
//  ConnectionManager.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/20/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Curso.h"
#import "Seccion.h"

@interface ConnectionManager : NSObject

@property (nonatomic,retain) NSString *dataBaseName;
@property (nonatomic,retain) NSString *dataBasePath;

-(void) LoadDB;
-(NSMutableArray*) LoadCursos;
-(BOOL)insertCursoWith:(Curso*)newCurso;
-(BOOL)updateCursoWith:(Curso*)newCurso;
-(BOOL)deleteCursoWith:(NSString*)idCurso;

-(NSMutableArray*) LoadSeccionesOfCurso:(NSString*)idCurso;
-(BOOL)insertSeccionWith:(Seccion*)newSeccion;
-(BOOL)updateSeccionWith:(Seccion*)newSeccion;
-(BOOL)deleteSeccionWith:(NSString*)idSeccion;
@end
