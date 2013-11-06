//
//  TicketDetailsViewController.h
//  Hamilton
//
//  Created by Zaninovich, Adam on 11/5/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Ticket.h"

@interface TicketDetailsViewController : UIViewController
@property (strong, nonatomic) Ticket *ticket;
@end
