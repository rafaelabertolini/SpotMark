//
//  loadParse.m
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 27/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import <Parse/Parse.h>
#import "loadParse.h"

@implementation loadParse

-(NSMutableArray *)loadEvents{
    NSUInteger limit = 1000;
    NSUInteger skip = 0;
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query orderByDescending:@"createdAt"];
    [query setLimit: limit];
    [query setSkip: skip];
    NSArray *objects = query.findObjects;
    return [objects mutableCopy];
}

-(NSMutableArray *) loadPosts : (NSString *) idEvent{
    NSUInteger limit = 1000;
    NSUInteger skip = 0;
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query whereKey:@"idEvent" equalTo:idEvent];
    [query setLimit: limit];
    [query setSkip: skip];
    NSArray *objects = query.findObjects;
    return [objects mutableCopy];
}

@end
