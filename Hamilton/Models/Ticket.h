//
//  Ticket.h
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface Ticket : NSObject

+ (NSArray *)loadTickets;
- (id)initWithDictionary:(NSDictionary *)attributes;

@property (strong, nonatomic) Event *event;
@property (strong, nonatomic) NSString *registrationGUID;

@end
