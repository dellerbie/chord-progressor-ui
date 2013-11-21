//
//  CPRoundedRectButton.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/21/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "CPRoundedRectButton.h"

@implementation CPRoundedRectButton

- (void)drawRect:(CGRect)rect
{
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGRect buttonRect = CGRectMake(self.bounds.origin.x + DEFAULT_STROKE_SIZE, self.bounds.origin.y + DEFAULT_STROKE_SIZE, self.bounds.size.width - DEFAULT_STROKE_SIZE * 2, self.bounds.size.height - DEFAULT_STROKE_SIZE * 2);
  
  CGContextSaveGState(context);
  
  UIBezierPath *circleShapePath = [UIBezierPath bezierPathWithRoundedRect:buttonRect cornerRadius:3.0];
  [circleShapePath addClip];
  
  if(self.isHighlighted)
  {
    self.fillColor = RED_COLOR;
  }
  else
  {
    self.fillColor = CHORD_BG_COLOR;
  }
  
  [self.fillColor setFill];
  CGContextFillRect(context, buttonRect);
  CGContextRestoreGState(context);
  
  if(!self.isHighlighted)
  {
    [self.strokeColor setStroke];
    [circleShapePath setLineWidth:DEFAULT_STROKE_SIZE];
    [circleShapePath stroke];
  }
  
  CGColorSpaceRelease(colorSpace);
}

- (void)setHighlighted:(BOOL)highlighted
{
  [super setHighlighted:highlighted];
  [self setNeedsDisplay];
}

@end
