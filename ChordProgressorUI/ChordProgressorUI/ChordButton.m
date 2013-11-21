//
//  ChordButton.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/20/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "ChordButton.h"

#define FONT_SIZE (16)
#define STROKE_SIZE (2.0)

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
    self.fillColor = CHORD_BG_COLOR;
    self.strokeColor = STROKE_COLOR;
    self.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:FONT_SIZE];
    [self setTitleColor:MAIN_FONT_COLOR forState:UIControlStateNormal];
    [self setTitleColor:WHITE_COLOR forState:UIControlStateHighlighted];
  }
  return self;
}

- (void)drawRect:(CGRect)rect
{
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGRect buttonRect = CGRectMake(self.bounds.origin.x + STROKE_SIZE, self.bounds.origin.y + STROKE_SIZE, self.bounds.size.width - STROKE_SIZE * 2, self.bounds.size.height - STROKE_SIZE * 2);
  
  CGContextSaveGState(context);
  
  UIBezierPath *circleShapePath = [UIBezierPath bezierPathWithOvalInRect:buttonRect];
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
    [circleShapePath setLineWidth:STROKE_SIZE];
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
