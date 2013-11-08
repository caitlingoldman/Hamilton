//
//  EventDetailsViewController.h
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Event.h"

@interface EventDetailsViewController : UIViewController
@property (strong, nonatomic) Event *event;
@end
