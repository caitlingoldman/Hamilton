//
//  TicketDetailsView.m
//  Hamilton
//
//  Created by Zaninovich, Adam on 11/6/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "TicketDetailsView.h"

@implementation TicketDetailsView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {}
  return self;
}

- (void)drawRect:(CGRect)rect {
  [self drawLineUnderMap];
}

- (void)drawLineUnderMap {
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 2.0);
  CGContextSetStrokeColorWithColor(context, [UIColor groupTableViewBackgroundColor].CGColor);
  CGContextMoveToPoint(context, 0, 200);
  CGContextAddLineToPoint(context, 320, 200);
  CGContextStrokePath(context);
}

@end
