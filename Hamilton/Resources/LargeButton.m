//
//  LargeButton.m
//  Hamilton
//
//  Created by Goldman, Caitlin on 11/4/13.
//  Copyright (c) 2013 Caitlin and Adam. All rights reserved.
//

#import "LargeButton.h"

@implementation LargeButton
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    
}

- (void)useGreenConfirmStyle
{
    self.backgroundColor = [UIColor lightGrayColor];
}


@end
