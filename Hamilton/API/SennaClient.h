//
//  SennaClient.h
//  Hamilton
//
//  Created by Developer on 11/6/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface SennaClient : AFHTTPSessionManager
+ (SennaClient *)sharedClient;
- (NSURLSessionDataTask *)getEventsWithCompletion:( void(^)(NSArray *results, NSError *error) )completion;
@end
