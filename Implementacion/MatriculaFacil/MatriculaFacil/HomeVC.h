//
//  HomeVC.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/17/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeVC : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
{
    NSMutableArray *cursos;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
