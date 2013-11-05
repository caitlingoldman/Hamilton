//
//  TicketTableViewCell.h
//  Hamilton
//
//  Created by Developer on 11/1/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *location;

@end
