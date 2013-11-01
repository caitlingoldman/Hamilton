//
//  Event.m
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "Event.h"

@implementation Event

+ (NSArray *)loadEvents{
  sleep(2);
  NSMutableArray *events = [[NSMutableArray alloc] init];
  
  for (int i = 0; i < 50; i++) {
    NSDictionary *attributes = @{
                                 @"name" : [NSString stringWithFormat:@"Event %d", i+1],
                                 @"startDate" : [NSDate date]
                                 };
    Event *event = [[Event alloc] initWithDictionary:attributes];
    [events addObject:event];
  }
  
  return events;
}

- (id)initWithDictionary:(NSDictionary *)attributes{
  self.name = attributes[@"name"];
  self.startDate = attributes[@"startDate"];
  return self;
}

- (NSString *)formattedStartDate{
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"MM/dd/yyyy"];
  return [dateFormatter stringFromDate:self.startDate];
}

@end
