//
//  ChordButton.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/20/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "ChordButton.h"

@implementation ChordButton

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self)
  {
    self.fillColor = CHORD_BG_COLOR;
    self.strokeColor = STROKE_COLOR;
    self.strokeSize = DEFAULT_STROKE_SIZE;
    self.fontSize = DEFAULT_FONT_SIZE;
    self.titleLabel.font = DEFAULT_FONT;
    [self setTitleColor:MAIN_FONT_COLOR forState:UIControlStateNormal];
    [self setTitleColor:WHITE_COLOR forState:UIControlStateHighlighted];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor strokeSize:(CGFloat)strokeSize fontSize:(CGFloat)fontSize
{
  self = [super initWithFrame:frame];
  if(self)
  {
    self.fillColor = fillColor;
    self.strokeColor = strokeColor;
    self.strokeSize = strokeSize;
    self.fontSize = fontSize;
    self.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:self.fontSize];
    [self setTitleColor:MAIN_FONT_COLOR forState:UIControlStateNormal];
    [self setTitleColor:WHITE_COLOR forState:UIControlStateHighlighted];
  }
  return self;
}

- (void)drawRect:(CGRect)rect
{
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGRect buttonRect = CGRectMake(self.bounds.origin.x + self.strokeSize, self.bounds.origin.y + self.strokeSize, self.bounds.size.width - self.strokeSize * 2, self.bounds.size.height - self.strokeSize * 2);
  
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
    [circleShapePath setLineWidth:self.strokeSize];
    [circleShapePath stroke];
  }

  CGColorSpaceRelease(colorSpace);
}

- (void)setHighlighted:(BOOL)highlighted
{
  [super setHighlighted:highlighted];
  [self setNeedsDisplay];
}

- (void)setFontSize:(CGFloat)fontSize
{
  _fontSize = fontSize;
  self.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:_fontSize];
}

@end
