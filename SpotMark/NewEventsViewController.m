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
@property (weak, nonatomic) IBOutlet UIDatePicker *dpdate;

@end

@implementation NewEventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    e.date = _dpdate.date;
    [dateFormat setDateFormat:@"d/M/YYYY"];
    e.date = [dateFormat stringFromDate:_dpdate.date];
    [dateFormat setDateFormat:@"hh:mm"];
    e.time = [dateFormat stringFromDate:_dpdate.date];
    
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
