//
//  loadParse.h
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 27/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface loadParse : NSObject

-(NSMutableArray *) loadEvents;
-(NSMutableArray *) loadPosts : (NSString *) idEvent;

@end
