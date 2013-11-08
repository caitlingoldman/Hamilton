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

@interface EventDetailsViewController() <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UILabel *cityAndState;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation EventDetailsViewController

- (void) viewDidLoad {
  [super viewDidLoad];
  self.title = self.event.name;
  self.startDate.text = [self.event formattedStartDate];
  self.cityAndState.text = self.event.cityAndState;
  self.description.text = self.event.description;
  [self setRegButton];
  [self setImage];
  [self updateLocation];
}

- (void)setRegButton {
  if (self.event.isOpen) {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [self.registerButton setAlpha:1];
    [UIView commitAnimations];
  }
}

- (void)setImage {
  self.eventImage.image = nil;
  [self.eventImage cancelImageRequestOperation];
  NSURL *imageURL = [NSURL URLWithString:self.event.imageURL];
  if (imageURL) {
    [self.eventImage setImageWithURL:imageURL];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  self.locationManager = nil;
}

#pragma mark - Mapping location

- (CLLocationManager *)locationManager {
  if (!_locationManager) {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    _locationManager.delegate = self;
  }
  return _locationManager;
}

- (void)updateLocation {
  [self.locationManager startUpdatingLocation];
}

- (void)zoomToLocation:(CLLocation *)location radius:(CGFloat)radius {
  MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, radius, radius);
  [self.map setRegion:region];
}

#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  CLLocation *location = [locations lastObject];
  [self zoomToLocation:location radius:500];
  [self.locationManager stopUpdatingLocation];
}


@end
