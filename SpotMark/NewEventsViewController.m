//
//  NewEventsViewController.m
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 24/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "NewEventsViewController.h"
#import <Parse/Parse.h>

@interface NewEventsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtDescription;
@property (weak, nonatomic) IBOutlet UITextField *txtLocalization;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
//
@implementation NewEventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.datePicker setValue:[UIColor colorWithRed:1 green:0.97 blue:0.84 alpha:0.70] forKeyPath:@"textColor"];
    
    SEL selector = NSSelectorFromString(@"setHighlightsToday:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDatePicker instanceMethodSignatureForSelector:selector]];
    BOOL no = NO;
    [invocation setSelector:selector];
    [invocation setArgument:&no atIndex:2];
    [invocation invokeWithTarget:self.datePicker];
    
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:0.97 blue:0.84 alpha:0.70]};
    self.title = @"New Event";
}
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)create:(id)sender {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    PFObject *saveObject = [PFObject objectWithClassName:@"Event"];
    saveObject[@"name"] =  _txtName.text;;
    saveObject[@"description"] = _txtDescription.text;
    saveObject[@"local"] = _txtLocalization.text;
    [dateFormat setDateFormat:@"d/M/YYYY"];
    saveObject[@"date"] = [dateFormat stringFromDate:_datePicker.date];
    [dateFormat setDateFormat:@"hh:mm"];
    saveObject[@"time"] = [dateFormat stringFromDate:_datePicker.date];
    
    [saveObject saveInBackground];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Evento criado com sucesso!"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [self performSegueWithIdentifier:@"gotoOneEvent" sender:nil];

}

- (BOOL) hidesBottomBarWhenPushed{
    return YES;
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
