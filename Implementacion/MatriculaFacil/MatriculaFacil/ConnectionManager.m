//
//  ConnectionManager.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/20/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "ConnectionManager.h"
#import "Curso.h"
#import <sqlite3.h>

@implementation ConnectionManager

@synthesize dataBaseName,dataBasePath;

-(void)LoadDB
{
    BOOL exito;
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    dataBasePath = [documentsDirectory stringByAppendingPathComponent:@"MatriculaFacil.sqlite"];
    NSFileManager *filemanager = [ NSFileManager defaultManager];
    NSError *error;
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"MatriculaFacil.sqlite" ];
    exito = [filemanager fileExistsAtPath:writableDBPath];
    
    if(exito)
    {
        NSLog(@"Se cargo DB");
        return;
    }
    
    NSString *defaultDBPath = [[[NSBundle mainBundle]resourcePath ]stringByAppendingPathComponent:@"MatriculaFacil.sqlite"];
    exito = [filemanager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    
    if (!exito) {
        
        NSLog(@"%@",[error localizedDescription]);
    }
    
}
-(NSMutableArray*) LoadCursos
{
    sqlite3 *database;
    sqlite3_stmt *sentencia;
    NSMutableArray *cursos = [[NSMutableArray alloc]init];
    
    if(sqlite3_open([dataBasePath UTF8String], &database)== SQLITE_OK)
    {
        NSString *sentenciaSQL = [NSString stringWithFormat:@"select * from Curso"];
        
        if(sqlite3_prepare_v2(database, [sentenciaSQL UTF8String], -1, &sentencia, NULL)== SQLITE_OK )
        {
            while(sqlite3_step(sentencia)==SQLITE_ROW)
            {
                Curso *curso = [[Curso alloc]init];
                curso.idCurso = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 0)];
                curso.nombre = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 1)];
                curso.codigo = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 2)];
                curso.requisito = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 3)];
                curso.creditos = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 4)];
                curso.ciclo = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 5)];
                [cursos addObject:curso];
                
            }
        }
        sqlite3_finalize(sentencia);
    }
    sqlite3_close(database);
    
    return cursos;

}
@end
