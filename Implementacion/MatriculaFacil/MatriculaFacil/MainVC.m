//
//  MainVC.m
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/8/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import "MainVC.h"
#import "MainCell.h"
@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigation];
    [self initializeControls];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initializeControls
{
    Options = [[NSMutableArray alloc]initWithObjects:@"Cursos",@"Secciones", nil];
    DetailOptions = [[NSMutableArray alloc]initWithObjects:@"Permite Listar, Crear, Modificar y Eliminar cursos de la presente matrícula",@"Permite Listar, Crear, Modificar y Eliminar secciones de la presente matrícula", nil];
}
-(void) customNavigation
{
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
#pragma mark - UITableview Delegate

- (CGFloat)heightForText:(NSString *)text
{
    UIFont *cellFont = [UIFont systemFontOfSize:15];
    //    CGSize constraintSize = CGSizeMake(192, MAXFLOAT);
    CGSize constraintSize = CGSizeMake(248, 100);
    CGRect labelSize = [text boundingRectWithSize:constraintSize
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:cellFont}
                                          context:nil];
    CGFloat height = labelSize.size.height;
    
    return height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
    
        [self performSegueWithIdentifier:@"ListCurso" sender:self];
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [Options count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return  209;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

        static NSString *cellIdentifier = @"MainCell";
        MainCell *cell = (MainCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                                                     forIndexPath:indexPath];

        cell.title.text = [Options objectAtIndex:indexPath.row];
        cell.subtitle.text = [DetailOptions objectAtIndex:indexPath.row];
        cell.subtitle.frame = CGRectMake(23, 94, 248, [self heightForText:[DetailOptions objectAtIndex:indexPath.row]]);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
        
    

}



@end
