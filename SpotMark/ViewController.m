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
    FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.readPermissions =    @[@"phone_number",
                                        @"public_profile",
                                        @"user_location",
                                        @"user_birthday",
                                        @"user_likes"];
    loginView.delegate = self;
}


-(void)viewDidAppear:(BOOL)animated{
//    if (FBSession.activeSession.isOpen)
//    {
//    [[FBRequest requestForMe] startWithCompletionHandler:
//      ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
//          if (!error) {
//             // NSLog(@"%@",[user objectForKey:@"email"]);
//             // NSLog(@"%@",user);
//              
//          } else {
//              NSLog(@"error: %@", error);
//          }
//      }];
//        [self performSegueWithIdentifier:@"gotoEvents" sender: nil];
//    }

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoEvents"])
    {
        //TODO
    }
}


-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
   NSLog(@"%@",[user objectForKey:@"user_birthday"]);
    NSLog(@"%@",[user objectForKey:@"phone_number"]);
    NSLog(@"%@",[user objectForKey:@"email"]);
}


-(void) loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"loginview");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
