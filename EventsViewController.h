//
//  EventsViewController.h
//  SpotMark
//
//  Created by Rafaela dos Santos Bertolini on 19/02/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController <UITableViewDelegate , UITableViewDataSource, UIGestureRecognizerDelegate>

@property NSMutableArray *events;

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

@end
