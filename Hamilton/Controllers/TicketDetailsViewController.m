//
//  TicketDetailsViewController.m
//  Hamilton
//
//  Created by Zaninovich, Adam on 11/5/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "TicketDetailsViewController.h"

@interface TicketDetailsViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation TicketDetailsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = self.ticket.event.name;
  [self updateLocation];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  self.locationManager = nil;
}

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
  [self zoomToLocation:location radius:750];
  [self.locationManager stopUpdatingLocation];
}

@end
