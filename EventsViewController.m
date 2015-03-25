//
//  EventsViewController.m
//  SpotMark
//
//  Created by Rafaela dos Santos Bertolini on 19/02/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "EventsViewController.h"
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "LoadParse.h"
#import "Event.h"

@interface EventsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:0.97 blue:0.84 alpha:0.70]};
   
    self.title = @"Events";
  
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.rowHeight = 100;
    _tableView.backgroundColor = [UIColor clearColor];
    
    LoadParse *ld = [[LoadParse alloc] init];
    NSMutableArray *array = [ld loadEvents];
    NSLog(@"%lu",array.count);
    for(int i=0; i<array.count;i++){
        Event *e = [array objectAtIndex:i];
        NSLog(@"%@",e);
    }
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
