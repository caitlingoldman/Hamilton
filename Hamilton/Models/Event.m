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
  NSMutableArray *events = [[NSMutableArray alloc] init];
  
  for (int i = 0; i < 50; i++) {
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
    [events addObject:event];
  }
  
  return events;
}

- (id)initWithDictionary:(NSDictionary *)attributes{
  self.name = attributes[@"name"];
  self.startDate = attributes[@"startDate"];
  self.imageURL = attributes[@"imageURL"];
  return self;
}

- (NSString *)formattedStartDate{
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"MM/dd/yyyy"];
  return [dateFormatter stringFromDate:self.startDate];
}

- (NSString *)cityAndState{
  return @"San Diego, California";
}

@end
