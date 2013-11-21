//
//  BarView.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/20/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "BarView.h"

@implementation BarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      self.layer.borderColor = [[UIColor colorWithRed:TO_RGB(54) green:TO_RGB(54) blue:TO_RGB(54) alpha:1.0] CGColor];
      self.layer.borderWidth = 2.0f;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
