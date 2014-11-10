//
//  MainVC.h
//  MatriculaFacil
//
//  Created by Alvaro Herrera Cotrina on 11/8/14.
//  Copyright (c) 2014 sKDevs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController<UIActionSheetDelegate>
{
    NSMutableArray *Options;
    NSMutableArray *DetailOptions;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
