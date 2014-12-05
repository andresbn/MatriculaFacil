//
//  SeccionesTVC.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/10/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "SeccionesTVC.h"
#import "SeccionCell.h"
#import "Seccion.h"
#import "UpdateSeccionVC.h"
@interface SeccionesTVC ()

@end

@implementation SeccionesTVC

@synthesize cur;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customNavigation];
    [self fillData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTable)
                                                 name:@"reload2"
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) fillData
{
    manager = [[ConnectionManager alloc]init];
    [manager LoadDB];
    secciones = [manager LoadSeccionesOfCurso:cur.idCurso];
    NSLog(@"%@",secciones);
}
-(void)reloadTable
{
    [self fillData];
    [self.tableView reloadData];
}
-(void) customNavigation
{
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
    container.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.topItem.title = @" ";
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(-9, -3, 170, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = cur.nombre;
    title.center = container.center;
    title.textColor = [UIColor redColor];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title];
    

    
    self.navigationItem.titleView = container;
}
- (IBAction)CrearSeccion:(id)sender {
    
    
    NSString *idCurso = cur.idCurso;
    [[NSUserDefaults standardUserDefaults] setObject:idCurso forKey:@"idCurso"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    [self performSegueWithIdentifier:@"CrearSeccion" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"UpdateSeccion"]) {
        NSIndexPath *indexPath = nil;
        
        Seccion *sec = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            sec = [searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            sec = [secciones objectAtIndex:indexPath.row];
        }
        
        UpdateSeccionVC *destViewController = segue.destinationViewController;
        destViewController.sec = sec;
        
    }
    
}

#pragma mark - UISearchBar Methods

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"codigo contains[c] %@", searchText];
    searchResults = (NSMutableArray*)[secciones filteredArrayUsingPredicate:resultPredicate];
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
#pragma mark - Table view data source
-(void) reorderPositions
{
    for (int i=0; i<secciones.count; i++) {
        NSString *inStr = [NSString stringWithFormat: @"%ld", (long)i];
        ((Seccion *)[secciones objectAtIndex:i]).idSeccion = inStr;
        
        
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [secciones count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ListCursoCell";
    SeccionCell *cell = (SeccionCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                                                forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[SeccionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Seccion *seccion = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        seccion = [searchResults objectAtIndex:indexPath.row];
    } else {
        seccion = [secciones objectAtIndex:indexPath.row];
    }
    
    
    cell.codigo.text = seccion.codigo;
    cell.profesor.text = [NSString stringWithFormat:@"Profesor: %@",seccion.profesor];
    cell.salon.text = [NSString stringWithFormat:@"Salón: %@",seccion.salon];
    cell.inicio.text = [NSString stringWithFormat:@"Inicio: %@",seccion.inicio];
    cell.fin.text = [NSString stringWithFormat:@"Fin: %@",seccion.fin];
    cell.tipo.text = [NSString stringWithFormat:@"Tipo: %@",seccion.tipo];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 225;
}
-(void)tableView:(UITableView *) tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
//            [self reorderPositions];
            NSString *pos = ((Seccion*)[searchResults objectAtIndex:indexPath.row]).idSeccion;
            NSInteger myint = [pos intValue];
            
            manager = [[ConnectionManager alloc]init];
            [manager LoadDB];
            
            BOOL success;
            success = [manager deleteSeccionWith:pos];
            
            if (success) {
                
                UIAlertView *alerta = [[UIAlertView alloc ] initWithTitle:@"Confirmación" message:@"Se elimino un registro en la base de datos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alerta show];
                
                [self reloadTable];
            }
            else
            {
                
                UIAlertView *alerta = [[UIAlertView alloc ] initWithTitle:@"Confirmación" message:@"No se elimino añadir registro" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alerta show];
            }
            
            
            [self reloadTable];
            NSLog(@"%@",secciones);
            self.searchDisplayController.searchBar.text = @"";
            [self.tableView reloadData];
            [self setEditing:NO];
            
            
        }
        else
        {
            manager = [[ConnectionManager alloc]init];
            [manager LoadDB];
            BOOL success;
            NSString *myint = ((Seccion*)[secciones objectAtIndex:indexPath.row]).idSeccion;
            
            success = [manager deleteSeccionWith:myint];
            
            if (success) {
                
                UIAlertView *alerta = [[UIAlertView alloc ] initWithTitle:@"Confirmación" message:@"Se elimino un registro en la base de datos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alerta show];
                
                [self reloadTable];
            }
            else
            {
                
                UIAlertView *alerta = [[UIAlertView alloc ] initWithTitle:@"Confirmación" message:@"No se elimino añadir registro" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alerta show];
            }
            [self reloadTable];
            [self.tableView reloadData];
            NSLog(@"%@",secciones);
        }
        
        [self.tableView reloadData];
        
    }
    
    
}


-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Eliminar";
}

@end
