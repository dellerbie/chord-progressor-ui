//
//  BarView.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/20/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "BarView.h"
#import "ChordButton.h"

#define LEFT_RIGHT_PADDING (8.0)
#define CHORD_SPACING (3.0)
#define STROKE_SIZE (2.0)
#define CHORD_BUTTON_SIZE (78.0)

@implementation BarView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self)
  {
    self.layer.borderColor = [STROKE_COLOR CGColor];
    self.layer.borderWidth = STROKE_SIZE;
    
    CGFloat buttonX = LEFT_RIGHT_PADDING;
    CGFloat buttonY = (self.frame.origin.y + (self.frame.size.height / 2)) - CHORD_BUTTON_SIZE;
    
    self.chordOneButton = [[ChordButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, WIDTH(CHORD_BUTTON_SIZE), HEIGHT(CHORD_BUTTON_SIZE))];
    [self.chordOneButton setTitle:@"VIIb" forState:UIControlStateNormal];
    
    buttonX += CHORD_BUTTON_SIZE/2 + CHORD_SPACING;
    self.chordTwoButton = [[ChordButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, WIDTH(CHORD_BUTTON_SIZE), HEIGHT(CHORD_BUTTON_SIZE))];
    [self.chordTwoButton setTitle:@"/" forState:UIControlStateNormal];
    
    buttonX += CHORD_BUTTON_SIZE/2 + CHORD_SPACING;
    self.chordThreeButton = [[ChordButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, WIDTH(CHORD_BUTTON_SIZE), HEIGHT(CHORD_BUTTON_SIZE))];
    [self.chordThreeButton setTitle:@"I" forState:UIControlStateNormal];
    
    buttonX += CHORD_BUTTON_SIZE/2 + CHORD_SPACING;
    self.chordFourButton = [[ChordButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, WIDTH(CHORD_BUTTON_SIZE), HEIGHT(CHORD_BUTTON_SIZE))];
    [self.chordFourButton setTitle:@"ii" forState:UIControlStateNormal];
    
    [self addSubview:self.chordOneButton];
    [self addSubview:self.chordTwoButton];
    [self addSubview:self.chordThreeButton];
    [self addSubview:self.chordFourButton];
  }
  return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
  NSLog(@"setHighlighted: %hhd", highlighted);
  if(highlighted)
  {
    self.backgroundColor = CHORD_BG_COLOR;
  }
  else
  {
    self.backgroundColor = BLACK_COLOR;
  }
  
  [self setNeedsDisplay];
}

@end
