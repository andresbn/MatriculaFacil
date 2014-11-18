//
//  SeccionesMatricula.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/17/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "SeccionesMatricula.h"
#import "SeccionCell.h"
#import "Seccion.h"
@interface SeccionesMatricula ()

@end

@implementation SeccionesMatricula

@synthesize cur;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillData];
    [self customNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(void) fillData
{
    secciones = [[NSMutableArray  alloc]init];
    Seccion *seccion = [[Seccion alloc]init];
    seccion.idSeccion = @"0";
    seccion.codigo = @"IN241";
    seccion.profesor = @"Julio López";
    seccion.salon = @"B43";
    seccion.inicio = @"2:00pm";
    seccion.fin = @"4:00pm";
    seccion.tipo = @"Teoría";
    [secciones addObject:seccion];
    
    Seccion *seccion2 = [[Seccion alloc]init];
    seccion2.idSeccion = @"1";
    seccion2.codigo = @"MF654";
    seccion2.profesor = @"Angela Salinas";
    seccion2.salon = @"A32";
    seccion2.inicio = @"6:00pm";
    seccion2.fin = @"9:00pm";
    seccion2.tipo = @"Laboratorio";
    [secciones addObject:seccion2];
}

#pragma  mark - Tableview Delegates 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Seccion *seccion = nil;
    seccion = [secciones objectAtIndex:indexPath.row];
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:seccion.codigo delegate:self     cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil   otherButtonTitles:@"Matricularme", nil];
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupQuery showInView:self.view];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

        return [secciones count];

    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"SeccionCell";
    SeccionCell *cell = (SeccionCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                                            forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[SeccionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Seccion *seccion = nil;
    seccion = [secciones objectAtIndex:indexPath.row];
    
    
//    [cell.estado addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    cell.codigo.text = seccion.codigo;
    cell.profesor.text = [NSString stringWithFormat:@"Profesor: %@",seccion.profesor];
    cell.salon.text = [NSString stringWithFormat:@"Salón: %@",seccion.salon];
    cell.inicio.text = [NSString stringWithFormat:@"Inicio: %@",seccion.inicio];
    cell.fin.text = [NSString stringWithFormat:@"Fin: %@",seccion.fin];
    cell.tipo.text = [NSString stringWithFormat:@"Tipo: %@",seccion.tipo];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
//- (void) switchChanged:(id)sender {
//    UISwitch* switchControl = sender;
//    if (switchControl.on) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//
//    NSLog( @"The switch is %@", switchControl.on ? @"ON" : @"OFF" );
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 225;
}
#pragma mark - UIActionSheet Delegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *option = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    //buttonIndex == 0 if the cancel button is pressed or
    //if the first item is pressed.
    NSLog(@"%@",option);
    
    if ([option isEqualToString:@"Matricularme"]) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }
}
@end
