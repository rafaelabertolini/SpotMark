//
//  ViewController.m
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 21/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet FBLoginView *loginButtom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginView = [[FBLoginView alloc] initWithPermissions:@[@"public_profile", @"email", @"user_friends"]];
    self.loginView.delegate = self;
    
    
//    if (![PFFacebookUtils isLinkedWithUser:user]) {
//        [PFFacebookUtils linkUser:user permissions:nil block:^(BOOL succeeded, NSError *error) {
//            if (succeeded) {
//                NSLog(@"Woohoo, user logged in with Facebook!");
//            }
//        }];
//    }
}

-(void)viewDidAppear:(BOOL)animated{
    if (FBSession.activeSession.isOpen)
    {
        NSLog(@"ss");
        [self performSegueWithIdentifier:@"gotoEvents" sender: nil];
        
//        [FBRequestConnection startForPostStatusUpdate:@"Sample Text" completionHandler:^(FBRequestConnection * connection , id result , NSError * error){
//            if (!error)
//            {
//                NSLog(@"Posted success fully");
//            }
//            else
//            {
//                NSLog(@"Error %@",error);
//            }
//        }];
    }
//    else
//    {
//        NSArray *permissions = [NSArray arrayWithObjects:@"publish_actions", @"publish_stream", nil];
//        
//        NSLog(@"Need to login");
//    }

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoDetailsView"])
    {
        //NSIndexPath *idx = [_tableView indexPathForCell:(UITableViewCell *)sender];
//        NSIndexPath *idx = (NSIndexPath *)sender;
        
    }
}


- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user{
    NSLog(@"sss");
}


-(void) loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"ddsdasdasd");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
