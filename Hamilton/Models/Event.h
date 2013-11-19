//
//  Event.h
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SennaClient.h"

@interface Event : NSObject

+ (NSURLSessionDataTask *)loadEventsWithCompletion:( void(^)(NSArray *events) )completion;
- (id)initWithDictionary:(NSDictionary *)attributes;
- (NSString *)formattedStartDate;
- (NSString *)cityAndState;

@property (strong, nonatomic) NSString *guid;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (strong, nonatomic) NSNumber *maxRegistrations;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSString *imageURL;
@property (nonatomic) BOOL isOpen;

@end
