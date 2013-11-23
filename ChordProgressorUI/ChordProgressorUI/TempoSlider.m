//
//  TempoSlider.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/22/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "TempoSlider.h"

@implementation TempoSlider

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
  return CGRectMake(0, 0, 10, 10);
}

@end
