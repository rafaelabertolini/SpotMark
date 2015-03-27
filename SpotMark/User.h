//
//  User.h
//  SpotMark
//
//  Created by Lucas Fraga Schuler on 27/03/15.
//  Copyright (c) 2015 Lucas Fraga Schuler. All rights reserved.
//

#import <foundation/Foundation.h>

@interface User : NSObject {
  
}

@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSMutableArray *friends_list;

+ (id)sharedUser;

@end