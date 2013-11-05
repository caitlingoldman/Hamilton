//
//  EventDetailsViewController.m
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "EventDetailsViewController.h"
#import "Event.h"
#import "UIImageView+AFNetworking.h"

@interface EventDetailsViewController()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *cityAndState;
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@end

@implementation EventDetailsViewController
@synthesize registerButton;

- (void) viewDidLoad {
    [super viewDidLoad];
    self.startDate.text = [self.event formattedStartDate];
    self.nameLabel.text = self.event.name;
    self.cityAndState.text = self.event.cityAndState;
    
    self.eventImage.image = nil;
    [self.eventImage cancelImageRequestOperation];
    
    NSURL *imageURL = [NSURL URLWithString:self.event.imageURL];
    if (imageURL) {
        [self.eventImage setImageWithURL:imageURL];
    }
    
    [registerButton useGreenConfirmStyle];
}

@end
