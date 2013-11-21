//
//  ChordButton.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/20/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "ChordButton.h"

@interface ChordButton ()

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong) UIColor *fillColor;

@end

@implementation ChordButton

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self)
  {
    self.fillColor = [UIColor colorWithRed:TO_RGB(37) green:TO_RGB(37) blue:TO_RGB(37) alpha:1.0];
    self.strokeColor = [UIColor colorWithRed:TO_RGB(54) green:TO_RGB(54) blue:TO_RGB(54) alpha:1.0];
    self.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:30];
    [self setTitleColor:[UIColor colorWithRed:TO_RGB(183) green:TO_RGB(183) blue:TO_RGB(183) alpha:1.0] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithRed:TO_RGB(255) green:TO_RGB(255) blue:TO_RGB(255) alpha:1.0] forState:UIControlStateHighlighted];
  }
  return self;
}

- (void)drawRect:(CGRect)rect
{
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGRect buttonRect = CGRectMake(self.bounds.origin.x + 2.0, self.bounds.origin.y + 2.0, self.bounds.size.width - 4.0, self.bounds.size.height - 4.0);
  
  UIBezierPath *circleShapePath = [UIBezierPath bezierPathWithOvalInRect:buttonRect];
  
  CGContextSaveGState(context);
  
  [circleShapePath addClip];
  
  [self.fillColor setFill];
  CGContextFillRect(context, buttonRect);
  CGContextRestoreGState(context);
  [self.strokeColor setStroke];
  [circleShapePath setLineWidth:2.0];
  [circleShapePath stroke];
  
  
  CGColorSpaceRelease(colorSpace);
}

// override setHighlighted to change the fillColor and strokeColor

@end
