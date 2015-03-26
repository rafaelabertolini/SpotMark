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
}

-(void)viewWillAppear:(BOOL)animated{
        [self loadEvents];
}

-(void)loadEvents{
    NSUInteger limit = 1000;
    NSUInteger skip = 0;
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query setLimit: limit];
    [query setSkip: skip];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"%lu",objects.count);
        if (!error) {
            _events = [objects mutableCopy];
            [self loadTableView];
        }}];
}

-(void) loadTableView{
    // TODO
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    CustomCell *c = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    n = [feed objectAtIndex:(int)indexPath.row];
//    c.feedTitle.text = n.title;
//    c.feedDescription.text = n.shortDesc;
//    NSURL *url = [NSURL URLWithString:n.image];
//    c.feedImageView.imageURL = url;
//    if (n.userDidRead) {
//        c.feedTitle.textColor = [UIColor grayColor];
//        c.feedDescription.textColor = [UIColor grayColor];
//    }else{
//        c.feedTitle.textColor = [UIColor blackColor];
//        c.feedDescription.textColor = [UIColor blackColor];
//    }
//
//    c.feedTitle=@"title";
//    return c;
    
//}

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
