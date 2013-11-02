//
//  EventsViewController.m
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "EventsViewController.h"
#import "EventTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "Event.h"
#import "EventDetailsViewController.h"

@interface EventsViewController ()
@property (strong, nonatomic) NSArray *events;
@end

@implementation EventsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.events = [Event loadEvents];
  
  UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
  [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
  self.refreshControl = refreshControl;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1; }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return self.events.count; }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"eventTableCell";
  EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  Event *event = [self.events objectAtIndex:indexPath.row];
  
  cell.name.text = event.name;
  cell.startDate.text = [event formattedStartDate];
  cell.location.text = [event cityAndState];
  
  cell.eventImage.image = nil;
  [cell.eventImage cancelImageRequestOperation];
  
  NSURL *imageURL = [NSURL URLWithString:event.imageURL];
  if (imageURL) {
    [cell.eventImage setImageWithURL:imageURL];
  }
  
  return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowEventDetails"]) {
        EventDetailsViewController *detailViewContoller = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Event *event = [self.events objectAtIndex:indexPath.row];
        detailViewContoller.event = event;
    }
}

#pragma mark - Refresh Control

- (void)refresh {
  self.events = [Event loadEvents];
  [self.tableView reloadData];
  [self.refreshControl endRefreshing];
}


@end
