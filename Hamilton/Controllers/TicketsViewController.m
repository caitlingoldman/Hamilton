//
//  TicketsViewController.m
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "TicketsViewController.h"
#import "TicketTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "Ticket.h"

@interface TicketsViewController ()
@property (strong, nonatomic) NSArray *tickets;
@end

@implementation TicketsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tickets = [Ticket loadTickets];
  
  UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
  [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
  self.refreshControl = refreshControl;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1; }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return self.tickets.count; }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"ticketTableCell";
  TicketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  Ticket *ticket = [self.tickets objectAtIndex:indexPath.row];

  cell.name.text = ticket.event.name;
  cell.startDate.text = [ticket.event formattedStartDate];
  cell.location.text = [ticket.event cityAndState];

//  cell.eventImage.image = nil;
//  [cell.eventImage cancelImageRequestOperation];
//
//  NSURL *imageURL = [NSURL URLWithString:ticket.event.imageURL];
//  if (imageURL) {
//    [cell.eventImage setImageWithURL:imageURL];
//  }
  
  return cell;
}

#pragma mark - Refresh Control

- (void)refresh {
  self.tickets = [Ticket loadTickets];
  [self.tableView reloadData];
  [self.refreshControl endRefreshing];
}


@end
