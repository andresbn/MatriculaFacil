//
//  ConnectionManager.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/20/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "ConnectionManager.h"
#import "Curso.h"
#import "Seccion.h"
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
-(BOOL)insertCursoWith: (Curso*)newCurso
{
    [self LoadDB];
    sqlite3 *database;
    sqlite3_stmt *sentencia;
    
    
    if(sqlite3_open([dataBasePath UTF8String], &database) == SQLITE_OK)
    {
        
        NSString *sql = [NSString stringWithFormat:@"insert into Curso (\"nombre\",\"codigo\",\"requisito\",\"creditos\",\"ciclo\") VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",newCurso.nombre,newCurso.codigo,newCurso.requisito,newCurso.creditos,newCurso.ciclo];
        
        NSLog(@"%@",sql);
        
        if(sqlite3_prepare_v2(database, [sql UTF8String ],-1,&sentencia, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(sentencia)==SQLITE_ROW){
                
            }
        }else{
            NSLog(@"Error en la creación del insert");
        }
        sqlite3_finalize(sentencia);
        
        return TRUE;
    }else{
        NSLog(@"No se a podido abrir la BD");
    }
    sqlite3_close(database);
    
    
    return FALSE;
}
-(BOOL)updateCursoWith:(Curso*)newCurso
{
    sqlite3 *database;
    sqlite3_stmt *sentencia = nil;
    
    if(sqlite3_open([dataBasePath UTF8String], &database)== SQLITE_OK)
    {
        
        NSString *sentenciaSQL = [NSString stringWithFormat:@"update Curso Set nombre = '%@', codigo = '%@', requisito = '%@',creditos = '%@',ciclo = '%@' Where id='%d'",newCurso.nombre,newCurso.codigo,newCurso.requisito,newCurso.creditos,newCurso.ciclo,[newCurso.idCurso intValue]];
        
        if(sqlite3_prepare_v2(database, [sentenciaSQL UTF8String], -1, &sentencia, NULL)==SQLITE_OK){
            sqlite3_bind_text(sentencia, 1, [newCurso.nombre UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 2, [newCurso.codigo UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 3, [newCurso.requisito UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 4, [newCurso.creditos UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 5, [newCurso.ciclo UTF8String], -1, SQLITE_TRANSIENT);
            
            
        }
        
      
    }
    char* errmsg;
    sqlite3_exec(database, "COMMIT", NULL, NULL, &errmsg);
    
    if(SQLITE_DONE != sqlite3_step(sentencia)){
        NSLog(@"Error while updating. %s", sqlite3_errmsg(database));
    }
    else{
        
    }
    sqlite3_finalize(sentencia);
    sqlite3_close(database);

    
    return TRUE;
}
-(BOOL)deleteCursoWith:(NSString*)idCurso
{
    sqlite3 *db;
    int dbrc;
    const char *dbFilePathUTF8 = [dataBasePath UTF8String];
    dbrc = sqlite3_open(dbFilePathUTF8, &db);
    if (dbrc) {
        NSLog(@"Impossibile aprire il Database!");
        return FALSE;
    }
    
    sqlite3_stmt *dbps;
    
    NSString *deleteStatementsNS = [NSString stringWithFormat: @"DELETE FROM Curso WHERE id='%d'", [idCurso intValue]];
    const char *deleteStatement = [deleteStatementsNS UTF8String];
    dbrc = sqlite3_prepare_v2(db, deleteStatement, -1, &dbps, NULL);
    dbrc = sqlite3_step(dbps);

    sqlite3_finalize(dbps);
    sqlite3_close(db);
    return TRUE;
}


-(NSMutableArray*) LoadSeccionesOfCurso:(NSString*)idCurso
{
    sqlite3 *database;
    sqlite3_stmt *sentencia;
    NSMutableArray *cursos = [[NSMutableArray alloc]init];
    
    if(sqlite3_open([dataBasePath UTF8String], &database)== SQLITE_OK)
    {
        NSString *sentenciaSQL = [NSString stringWithFormat:@"select * from Seccion Where idCurso = '%d'",[idCurso intValue]];
        
        if(sqlite3_prepare_v2(database, [sentenciaSQL UTF8String], -1, &sentencia, NULL)== SQLITE_OK )
        {
            while(sqlite3_step(sentencia)==SQLITE_ROW)
            {
                Seccion *seccion = [[Seccion alloc]init];
                seccion.idSeccion = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 0)];
                seccion.idCurso = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 1)];
                seccion.codigo = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 2)];
                seccion.profesor = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 3)];
                seccion.salon = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 4)];
                seccion.inicio = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 5)];
                seccion.fin = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 6)];
                seccion.tipo = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia, 7)];
                [cursos addObject:seccion];
                
            }
        }
        sqlite3_finalize(sentencia);
    }
    sqlite3_close(database);
    
    return cursos;
}
-(BOOL)insertSeccionWith:(Seccion*)newSeccion
{
    [self LoadDB];
    sqlite3 *database;
    sqlite3_stmt *sentencia;
    
    
    if(sqlite3_open([dataBasePath UTF8String], &database) == SQLITE_OK)
    {
        
        NSString *sql = [NSString stringWithFormat:@"insert into Seccion (\"idCurso\",\"codigo\",\"profesor\",\"salon\",\"inicio\",\"fin\",\"tipo\") VALUES (\"%d\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",[newSeccion.idCurso intValue],newSeccion.codigo,newSeccion.profesor,newSeccion.salon,newSeccion.inicio,newSeccion.fin,newSeccion.tipo];
        
        NSLog(@"%@",sql);
        
        if(sqlite3_prepare_v2(database, [sql UTF8String ],-1,&sentencia, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(sentencia)==SQLITE_ROW){
                
            }
        }else{
            NSLog(@"Error en la creación del insert");
        }
        sqlite3_finalize(sentencia);
        
        return TRUE;
    }else{
        NSLog(@"No se a podido abrir la BD");
    }
    sqlite3_close(database);
    
    
    return FALSE;
}
-(BOOL)updateSeccionWith:(Seccion*)newSeccion
{
    sqlite3 *database;
    sqlite3_stmt *sentencia = nil;
    
    if(sqlite3_open([dataBasePath UTF8String], &database)== SQLITE_OK)
    {
        
        NSString *sentenciaSQL = [NSString stringWithFormat:@"update Seccion Set codigo = '%@', profesor = '%@', salon = '%@',inicio = '%@',fin = '%@',tipo = '%@' Where idCurso='%d'",newSeccion.codigo,newSeccion.profesor,newSeccion.salon,newSeccion.inicio,newSeccion.fin,newSeccion.tipo,[newSeccion.idCurso intValue]];
        
        if(sqlite3_prepare_v2(database, [sentenciaSQL UTF8String], -1, &sentencia, NULL)==SQLITE_OK){
            sqlite3_bind_text(sentencia, 2, [newSeccion.codigo UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 3, [newSeccion.profesor UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 4, [newSeccion.salon UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 5, [newSeccion.inicio UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 6, [newSeccion.fin UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(sentencia, 7, [newSeccion.tipo UTF8String], -1, SQLITE_TRANSIENT);
            
            
        }
        
        
    }
    char* errmsg;
    sqlite3_exec(database, "COMMIT", NULL, NULL, &errmsg);
    
    if(SQLITE_DONE != sqlite3_step(sentencia)){
        NSLog(@"Error while updating. %s", sqlite3_errmsg(database));
    }
    else{
        
    }
    sqlite3_finalize(sentencia);
    sqlite3_close(database);
    
    
    return TRUE;
}
-(BOOL)deleteSeccionWith:(NSString*)idSeccion
{

    sqlite3 *db;
    int dbrc;
    const char *dbFilePathUTF8 = [dataBasePath UTF8String];
    dbrc = sqlite3_open(dbFilePathUTF8, &db);
    if (dbrc) {
        NSLog(@"Impossibile aprire il Database!");
        return FALSE;
    }
    
    sqlite3_stmt *dbps;
    
    NSString *deleteStatementsNS = [NSString stringWithFormat: @"DELETE FROM Seccion WHERE idSeccion='%d'", [idSeccion intValue]];
    const char *deleteStatement = [deleteStatementsNS UTF8String];
    dbrc = sqlite3_prepare_v2(db, deleteStatement, -1, &dbps, NULL);
    dbrc = sqlite3_step(dbps);
    
    sqlite3_finalize(dbps);
    sqlite3_close(db);
    return TRUE;

}
@end
