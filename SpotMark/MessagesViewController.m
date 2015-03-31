//
//  MessagesViewController.m
//  SpotMark
//
//  Created by Rafaela dos Santos Bertolini on 25/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "MessagesViewController.h"
#import "loadParse.h"
#import "User.h"
#import <Parse/Parse.h>
#import "Chat.h"



@interface MessagesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableViewM;
@property Chat *chat;



@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    _tableViewM.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableViewM.rowHeight = 75;
    _tableViewM.backgroundColor = [UIColor clearColor];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:0.97 blue:0.84 alpha:0.70]};
    self.title = @"Messages";
    
}
-(void)viewWillAppear:(BOOL)animated{
    [_tableViewM reloadData];
    loadParse *lp = [[loadParse alloc] init];
    User *user1 = [User sharedUser];
    _messages = [lp LoadMessages:user1.objectId];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    PFObject *m = [_messages objectAtIndex:(int)indexPath.row];
    cell.textLabel.text = m[@"name"];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _chat = [[Chat alloc] init];
    PFObject *m = [_messages objectAtIndex:(int)indexPath.row];
    _chat.name = m[@"name"];
    
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
