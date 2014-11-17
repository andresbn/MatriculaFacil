//
//  ListCursoTVC.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/9/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "ListCursoTVC.h"
#import "ListCursoCell.h"
#import "Curso.h"
#import "UpdateCursoVC.h"

@interface ListCursoTVC ()

@end

@implementation ListCursoTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customNavigation];
    [self fillData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) fillData
{
    cursos = [[NSMutableArray  alloc]init];
    Curso *curso = [[Curso alloc]init];
    curso.idCurso = @"0";
    curso.nombre = @"Algoritmos Avanzados";
    curso.codigo = @"MA213";
    curso.creditos = @"6";
    curso.requisito = @"SE213";
    curso.ciclo = @"4";
    [cursos addObject:curso];
    
    Curso *curso2 = [[Curso alloc]init];
    curso2.idCurso = @"1";
    curso2.nombre = @"Física 2";
    curso2.codigo = @"MA213";
    curso2.creditos = @"6";
    curso2.requisito = @"SE213";
    curso2.ciclo = @"4";
    [cursos addObject:curso2];
}
-(void) customNavigation
{
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
    container.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.topItem.title = @" ";
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(-9, -3, 170, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"Cursos";
    title.textColor = [UIColor redColor];
    title.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title];
    
    UILabel *title2 = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, 170, 40)];
    title2.textAlignment = NSTextAlignmentCenter;
    title2.text = @"Disponibles";
    title2.textColor = [UIColor redColor];
    title2.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title2];
    
    self.navigationItem.titleView = container;
}
- (IBAction)AddCurso:(id)sender {
    
    [self performSegueWithIdentifier:@"AddCurso" sender:self];
    
}

#pragma mark - UISearchBar Methods

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"nombre contains[c] %@", searchText];
    searchResults = (NSMutableArray*)[cursos filteredArrayUsingPredicate:resultPredicate];

}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"UpdateCurso"]) {
        NSIndexPath *indexPath = nil;
        
        Curso *curso = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            curso = [searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            curso = [cursos objectAtIndex:indexPath.row];
        }
        
        UpdateCursoVC *destViewController = segue.destinationViewController;
        destViewController.cur = curso;
        
    }
}
#pragma mark - Table view data source
-(void) reorderPositions
{
    for (int i=0; i<cursos.count; i++) {
        NSString *inStr = [NSString stringWithFormat: @"%ld", (long)i];
        ((Curso *)[cursos objectAtIndex:i]).idCurso = inStr;
        
        
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [cursos count];
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        [self performSegueWithIdentifier:@"UpdateCurso" sender:self];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ListCursoCell";
    ListCursoCell *cell = (ListCursoCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                                 forIndexPath:indexPath];
    

    
    if (cell == nil) {
        cell = [[ListCursoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Curso *curso = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        curso = [searchResults objectAtIndex:indexPath.row];
    } else {
        curso = [cursos objectAtIndex:indexPath.row];
    }

    cell.nombre.text = curso.nombre;
    cell.codigo.text = [NSString stringWithFormat:@"Código: %@",curso.codigo];
    cell.creditos.text = [NSString stringWithFormat:@"Créditos: %@",curso.creditos];
    cell.requisito.text = [NSString stringWithFormat:@"Requisito: %@",curso.requisito];
    cell.ciclo.text = [NSString stringWithFormat:@"Ciclo: %@",curso.ciclo];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
}
-(void)tableView:(UITableView *) tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            [self reorderPositions];
            NSString *pos = ((Curso*)[searchResults objectAtIndex:indexPath.row]).idCurso;
            NSInteger myint = [pos intValue];
            [cursos removeObjectAtIndex:(int)myint];
            NSLog(@"%@",cursos);
//            self.searchDisplayController.active = NO;
            self.searchDisplayController.searchBar.text = @"";
            [self.tableView reloadData];
            [self setEditing:NO];

            
        }
        else
        {
            [cursos removeObjectAtIndex:indexPath.row];
            [self.tableView reloadData];
            NSLog(@"%@",cursos);
        }

        [self.tableView reloadData];

    }


}


-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Eliminar";
}
@end
