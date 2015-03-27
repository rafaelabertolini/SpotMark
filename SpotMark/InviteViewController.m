//
//  InviteViewController.m
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 27/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "InviteViewController.h"
#import "User.h"
#import <FacebookSDK/FacebookSDK.h>

@interface InviteViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property User *user1;
@end

@implementation InviteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _user1 = [User sharedUser];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _user1.friends_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSDictionary<FBGraphUser> *friend = [_user1.friends_list objectAtIndex:(int)indexPath.row];
    cell.textLabel.text = friend.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    _evt = [[Event alloc] init];
//    PFObject *e = [_events objectAtIndex:(int)indexPath.row];
//    _evt.name = e[@"name"];
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
