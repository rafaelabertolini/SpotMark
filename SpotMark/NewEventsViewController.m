//
//  NewEventsViewController.m
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 24/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "NewEventsViewController.h"
#import "OneEventViewController.h"
#import "Event.h"
#import <Parse/Parse.h>

@interface NewEventsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtDescription;
@property (weak, nonatomic) IBOutlet UITextField *txtLocalization;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property Event *e;
@end

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
    _e = [[Event alloc] init];
    _e.name = _txtName.text;
    _e.desc = _txtDescription.text;
    _e.local = _txtLocalization.text;
    [dateFormat setDateFormat:@"d/M/YYYY"];
    _e.date = [dateFormat stringFromDate:_datePicker.date];
    [dateFormat setDateFormat:@"hh:mm"];
    _e.time = [dateFormat stringFromDate:_datePicker.date];
    
    PFObject *saveObject = [PFObject objectWithClassName:@"Event"];
    saveObject[@"name"] =  _e.name;
    saveObject[@"description"] = _e.desc;
    saveObject[@"local"] = _e.local;
    saveObject[@"time"] = _e.date;
    saveObject[@"time"] = _e.time;
    
    [saveObject saveInBackground];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Evento criado com sucesso!"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [self performSegueWithIdentifier:@"gotoOneEvent" sender:nil];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    OneEventViewController *oevt = (OneEventViewController *) segue.destinationViewController;
    
    oevt.txtAdress = _txtLocalization.text;
    oevt.evt = _e;

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
