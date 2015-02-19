//
//  EventsViewController.m
//  SpotMark
//
//  Created by Rafaela dos Santos Bertolini on 23/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "EventsViewController.h"
#import <UIKit/UIKit.h>

@interface EventsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //
    // Change the properties of the imageView and tableView (these could be set
    // in interface builder instead).
    //
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.rowHeight = 100;
    _tableView.backgroundColor = [UIColor clearColor];
    
    
//    UIImage *rowBackground;
//    UIImage *selectionBackground;
//    NSInteger sectionRows = [aTableView numberOfRowsInSection:[indexPath section]];
//    NSInteger row = [indexPath row];
//    if (row == 0 && row == sectionRows - 1)
//    {
//        rowBackground = [UIImage imageNamed:@"topAndBottomRow.png"];
//        selectionBackground = [UIImage imageNamed:@"topAndBottomRowSelected.png"];
//    }
//    else if (row == 0)
//    {
//        rowBackground = [UIImage imageNamed:@"topRow.png"];
//        selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
//    }
//    else if (row == sectionRows - 1)
//    {
//        rowBackground = [UIImage imageNamed:@"bottomRow.png"];
//        selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
//    }
//    else
//    {
//        rowBackground = [UIImage imageNamed:@"middleRow.png"];
//        selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
//    }
//    ((UIImageView *)cell.backgroundView).image = rowBackground;
//    ((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
//    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
