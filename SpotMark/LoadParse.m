//
//  LoadParse.m
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 25/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import "LoadParse.h"
#import <Parse/Parse.h>
#import "Event.h"

@interface LoadParse ()

@end

@implementation LoadParse

-(NSMutableArray *) loadEvents{
   NSMutableArray *allObjects = [NSMutableArray array];
    NSUInteger limit = 1000;
    NSUInteger skip = 0;
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query setLimit: limit];
    [query setSkip: skip];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            NSLog(@"%lu",objects.count);
        if (!error) {
           // allObjects = [objects mutableCopy];
           // [allObjects addObjectsFromArray:objects];
        }}];
        NSLog(@"%lu",allObjects.count);
    return allObjects;
}

@end
