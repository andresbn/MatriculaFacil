//
//  ConnectionManager.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/20/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionManager : NSObject

@property (nonatomic,retain) NSString *dataBaseName;
@property (nonatomic,retain) NSString *dataBasePath;

-(void) LoadDB;
-(NSMutableArray*) LoadCursos;
@end
