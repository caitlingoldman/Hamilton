//
//  Ticket.m
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

+ (NSArray *)loadTickets {
  NSMutableArray *tickets = [[NSMutableArray alloc] init];
  
  for (int i = 0; i < 5; i++) {
    NSArray *images = @[@"http://i.imgur.com/ZefykCr.jpg",
                        @"http://i.imgur.com/Ks8IFvD.jpg",
                        @"http://i.imgur.com/C4iX3GQ.jpg",
                        @"http://i.imgur.com/WjllUXc.jpg",
                        @"http://i.imgur.com/dq88KFa.png"];
    NSDictionary *attributes = @{
                                 @"name" : [NSString stringWithFormat:@"Event %d", i+1],
                                 @"startDate" : [NSDate date],
                                 @"imageURL" : [images objectAtIndex:i % 5]
                                 };
    Event *event = [[Event alloc] initWithDictionary:attributes];
    Ticket *ticket = [[Ticket alloc] initWithDictionary:@{@"event" : event,
                                                          @"registrationGUID" : [NSString stringWithFormat:@"bfa34cd324e234ae%d", i+1]}];
    [tickets addObject:ticket];
  }
  return tickets;

}

- (id)initWithDictionary:(NSDictionary *)attributes {
  self.event = attributes[@"event"];
  self.registrationGUID = attributes[@"registrationGUID"];
  return self;
}

@end
