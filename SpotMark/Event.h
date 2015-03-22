//
//  Event.h
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 19/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface Event : NSObject

@property NSString *name;
@property NSString *description;
@property NSString *local;
@property NSDate *date;
@property NSDate *time;
@property NSMutableArray *participants;
@property NSMutableArray *feed;
@property NSString *eventId;
//@property tipo *image;


+(Event *)eventCreator;
-(void)postCreator : (NSString *)title : (NSString *)post;
-(void)openChat;
-(void)change;


