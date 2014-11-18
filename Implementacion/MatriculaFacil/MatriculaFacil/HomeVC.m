//
//  HomeVC.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/17/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "HomeVC.h"
#import "HomeCell.h"
#import "Curso.h"
#import "SeccionesMatricula.h"

@interface HomeVC ()

@end

@implementation HomeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigation];
    [self fillData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
    curso.estado = @"0";
    [cursos addObject:curso];
    
    Curso *curso2 = [[Curso alloc]init];
    curso2.idCurso = @"1";
    curso2.nombre = @"Física 2";
    curso2.codigo = @"MA213";
    curso2.creditos = @"6";
    curso2.requisito = @"SE213";
    curso2.ciclo = @"4";
    curso2.estado = @"0";
    [cursos addObject:curso2];
}
-(void) customNavigation
{
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
    container.backgroundColor = [UIColor clearColor];
    
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, -3, 170, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"Matrícula";
    title.textColor = [UIColor redColor];
    title.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title];
    
    UILabel *title2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 11, 170, 40)];
    title2.textAlignment = NSTextAlignmentCenter;
    title2.text = @"Fácil";
    title2.textColor = [UIColor redColor];
    title2.font = [UIFont fontWithName:@"Avenir Next Condensed" size:14];
    [container addSubview:title2];
    
    self.navigationItem.titleView = container;
}
- (IBAction)LogOut:(id)sender {

    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:@"Matrícula Fácil" delegate:self     cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil   otherButtonTitles:@"Cerrar Sesión", nil];
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupQuery showInView:self.view];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SeccionesMatricula"]) {
        NSIndexPath *indexPath = nil;
        
        Curso *curso = nil;
        indexPath = [self.tableView indexPathForSelectedRow];
        curso = [cursos objectAtIndex:indexPath.row];
        
        SeccionesMatricula *destViewController = segue.destinationViewController;
        destViewController.cur = curso;
        
    }
}
#pragma mark - UIActionSheet Delegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *option = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    //buttonIndex == 0 if the cancel button is pressed or
    //if the first item is pressed.
    NSLog(@"%@",option);
    
    if ([option isEqualToString:@"Cerrar Sesión"]) {
        
        [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
        
        
    }
}

#pragma mark - Table view Delegate / Data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [cursos count];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"HomeCell";
    HomeCell *cell = (HomeCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                                                forIndexPath:indexPath];
    
    
    
    if (cell == nil) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Curso *curso = nil;
    curso = [cursos objectAtIndex:indexPath.row];
    cell.curso.text = curso.nombre;
    cell.codigo.text = curso.codigo;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([curso.estado isEqualToString:@"1"]) {
        
        [cell.estado setOn:YES animated:YES];
    }
    else{
        [cell.estado setOn:NO animated:YES];
    }

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

@end
