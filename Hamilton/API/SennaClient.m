//
//  SennaClient.m
//  Hamilton
//
//  Created by Developer on 11/6/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "SennaClient.h"

@implementation SennaClient

+ (SennaClient *)sharedClient {
  static SennaClient *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    NSURL *baseURL = [NSURL URLWithString:@"http://senna-mock.herokuapp.com/"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"Hamilton iOS 1.0.0"}];
    
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                      diskCapacity:50 * 1024 * 1024
                                                          diskPath:nil];
    
    [config setURLCache:cache];
    
    _sharedClient = [[SennaClient alloc] initWithBaseURL:baseURL
                                    sessionConfiguration:config];
    _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
  });
  return _sharedClient;
}

@end
