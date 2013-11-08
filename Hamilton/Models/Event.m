//
//  Event.m
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "Event.h"

@implementation Event

+ (NSURLSessionDataTask *)loadEventsWithCompletion:( void(^)(NSArray *events) )completion {
  NSURLSessionDataTask *task = [[SennaClient sharedClient] getEventsWithCompletion:^(NSArray *results, NSError *error) {
    NSMutableArray *events = [[NSMutableArray alloc] init];
    if (results) {
      for (NSDictionary *result in results) {
        Event *event = [[Event alloc] initWithDictionary:result];
        [events addObject:event];
      }
    } else {
      NSLog(@"ERROR: %@", error);
    }
    completion(events);
  }];
  return task;
}

- (id)initWithDictionary:(NSDictionary *)attributes{
  self.name = attributes[@"name"];
  self.startDate = [self dateFromString:attributes[@"start_date"]];
  self.endDate = [self dateFromString:attributes[@"end_date"]];
  self.imageURL = attributes[@"image"];
  self.description = attributes[@"description"];
  self.city = attributes[@"city"];
  self.state = attributes[@"state"];
  self.latitude = [self latFromGeo:attributes[@"geo"]];
  self.longitude = [self lonFromGeo:attributes[@"geo"]];
  self.isOpen = [attributes[@"open"] boolValue];
  self.maxRegistrations = attributes[@"max_registrations"];
  return self;
}

- (NSString *)latFromGeo:(NSString *)geo {
  return [[geo componentsSeparatedByString:@","] firstObject];;
}

- (NSString *)lonFromGeo:(NSString *)geo {
  return [[geo componentsSeparatedByString:@","] lastObject];;
}

- (NSDate *)dateFromString:(NSString *)dateString {
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"yyyy-MM-dd"];
  return [dateFormat dateFromString:dateString];
}

- (NSString *)formattedStartDate{
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"MM/dd/yyyy"];
  return [dateFormatter stringFromDate:self.startDate];
}

- (NSString *)cityAndState{
  return [NSString stringWithFormat:@"%@, %@", self.city, self.state];
}

@end
