//
//  Event.h
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

+ (NSArray *)loadEvents;
- (id)initWithDictionary:(NSDictionary *)attributes;
- (NSString *)formattedStartDate;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSNumber *maxRegistrations;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *registrationStatus;

@end
