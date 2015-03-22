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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.center = self.view.center;
    [self.view addSubview:loginView];
    
//    if (![PFFacebookUtils isLinkedWithUser:user]) {
//        [PFFacebookUtils linkUser:user permissions:nil block:^(BOOL succeeded, NSError *error) {
//            if (succeeded) {
//                NSLog(@"Woohoo, user logged in with Facebook!");
//            }
//        }];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
