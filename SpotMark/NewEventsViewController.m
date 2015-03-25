//
//  NewEventsViewController.m
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 24/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "Event.h"
#import "NewEventsViewController.h"

@interface NewEventsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtDescription;
@property (weak, nonatomic) IBOutlet UITextField *txtLocalization;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)create:(id)sender {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    Event *e = [[Event alloc] init];
    e.name = _txtName.text;
    e.desc = _txtDescription.text;
    e.local = _txtLocalization.text;
    e.date = _datePicker.date;
    [dateFormat setDateFormat:@"d/M/YYYY"];
    e.date = [dateFormat stringFromDate:_datePicker.date];
    [dateFormat setDateFormat:@"hh:mm"];
    e.time = [dateFormat stringFromDate:_datePicker.date];
    
    NSLog(@"%@",e.time);
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
