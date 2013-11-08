//
//  EventDetailsView.m
//  Hamilton
//
//  Created by Zaninovich, Adam on 11/7/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "EventDetailsView.h"

@implementation EventDetailsView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {}
  return self;
}

- (void)drawRect:(CGRect)rect {
  [self drawLineUnderImage];
  [self drawLineAboveMap];
  [self drawLineUnderMap];
}

- (void)drawLineUnderImage {
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 1.0);
  CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
  CGContextMoveToPoint(context, 0, 240);
  CGContextAddLineToPoint(context, 320, 240);
  CGContextStrokePath(context);
}

- (void)drawLineAboveMap {
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 1.0);
  CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
  CGContextMoveToPoint(context, 0, 277);
  CGContextAddLineToPoint(context, 320, 277);
  CGContextStrokePath(context);
}

- (void)drawLineUnderMap {
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 1.0);
  CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
  CGContextMoveToPoint(context, 0, 379);
  CGContextAddLineToPoint(context, 320, 379);
  CGContextStrokePath(context);
}

@end
