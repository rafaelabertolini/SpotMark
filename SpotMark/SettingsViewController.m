//
//  SettingsViewController.m
//  SpotMark
//
//  Created by Rafaela dos Santos Bertolini on 25/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "SettingsViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
@property (weak, nonatomic) IBOutlet FBLoginView *logoutButtom;
@property SettingsViewController *svc;

@property BOOL isLogged;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:0.97 blue:0.84 alpha:0.70]};
    self.title = @"Settings";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    if (FBSession.activeSession.isOpen && _isLogged==false) {
        _isLogged=true;
        
        //self.profilePicture.profileID = user.id;
        //self.lblUsername.text = user.name;
        //[self performSegueWithIdentifier:@"gotoLogin" sender:nil];
    }
}


@end
