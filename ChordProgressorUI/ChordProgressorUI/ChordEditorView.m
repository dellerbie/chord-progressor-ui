//
//  ChordEditorView.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/21/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "ChordEditorView.h"
#import "CPRoundedRectButton.h"

#define CE_PADDING_TOP (25.0)
#define CE_PADDING_LEFT_RIGHT (8.0)
#define CE_HEADER_SPACING (50.0)
#define CE_CHORD_BUTTON_SPACING (3.0)
#define CE_HEADER_BOTTOM_SPACING (5.0)
#define CE_MAIN_FONT_SIZE (12.0)
#define CE_CHORD_BUTTON_SIZE (30.0)
#define CE_CHORD_TYPE_BUTTON_WIDTH (65.0)
#define CE_CHORD_TYPE_BUTTON_HEIGHT (30.0)
#define CE_CHORD_STROKE_SIZE (1.0)
#define CE_DISMISS_BUTTON_TOP CE_PADDING_LEFT_RIGHT
#define CE_DISMISS_BUTTON_SIZE (8.0)

@implementation ChordEditorView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self)
  {
    self.layer.borderColor = [CHORD_EDITOR_STROKE_COLOR CGColor];
    self.layer.borderWidth = DEFAULT_STROKE_SIZE;
    self.backgroundColor = CHORD_BG_COLOR;
    
    // header labels
    
    NSDictionary *headerAttributes = @{ NSFontAttributeName : DEFAULT_FONT, NSForegroundColorAttributeName : CHORD_EDITOR_FONT_COLOR };
    
    self.chordRootsLabel = [[UILabel alloc] init];
    NSString *chordRootsText = @"Chord Root";
    self.chordRootsLabel.text = chordRootsText;
    self.chordRootsLabel.textColor = CHORD_EDITOR_FONT_COLOR;
    self.chordRootsLabel.font = DEFAULT_FONT;
    CGSize chordRootsLabelSize = [chordRootsText sizeWithAttributes:headerAttributes];
    self.chordRootsLabel.frame = CGRectMake(CE_PADDING_LEFT_RIGHT, CE_PADDING_TOP, chordRootsLabelSize.width, chordRootsLabelSize.height);
    [self addSubview:self.chordRootsLabel];
    
    self.chordTypesLabel = [[UILabel alloc] init];
    NSString *chordTypesText = @"Chord Type";
    self.chordTypesLabel.text = chordTypesText;
    self.chordTypesLabel.textColor = CHORD_EDITOR_FONT_COLOR;
    self.chordTypesLabel.font = DEFAULT_FONT;
    CGSize chordTypesLabelSize = [chordTypesText sizeWithAttributes:headerAttributes];
    self.chordTypesLabel.frame = CGRectMake(self.chordRootsLabel.frame.origin.x + self.chordRootsLabel.frame.size.width + CE_HEADER_SPACING, CE_PADDING_TOP, chordTypesLabelSize.width, chordTypesLabelSize.height);
    [self addSubview:self.chordTypesLabel];
    
    // chord buttons
    
    CGFloat chordButtonX = CE_PADDING_LEFT_RIGHT;
    CGFloat chordButtonY = self.chordRootsLabel.frame.origin.y + chordRootsLabelSize.height + CE_HEADER_BOTTOM_SPACING;
    
    for(int i = 0; i < 11; i++)
    {
      ChordButton *chordButton = [[ChordButton alloc] initWithFrame:CGRectMake(chordButtonX, chordButtonY, CE_CHORD_BUTTON_SIZE, CE_CHORD_BUTTON_SIZE)];
      chordButton.fontSize = CE_MAIN_FONT_SIZE;
      chordButton.strokeSize = CE_CHORD_STROKE_SIZE;
      [chordButton setTitle:@"VIIb" forState:UIControlStateNormal];
      
      if(i > 0 && (i + 1) % 3 == 0)
      {
        chordButtonX = CE_PADDING_LEFT_RIGHT;
        chordButtonY += CE_CHORD_BUTTON_SIZE + CE_CHORD_BUTTON_SPACING;
      }
      else
      {
        chordButtonX += CE_CHORD_BUTTON_SIZE + CE_CHORD_BUTTON_SPACING;
      }
      
      [self addSubview:chordButton];
    }
    
    // chord types
    
    CGRect chordTypesLabelFrame = self.chordTypesLabel.frame;
    self.majorChordTypeButton = [[CPRoundedRectButton alloc] initWithFrame:CGRectMake(chordTypesLabelFrame.origin.x, chordTypesLabelFrame.origin.y + chordTypesLabelSize.height + CE_HEADER_BOTTOM_SPACING, CE_CHORD_TYPE_BUTTON_WIDTH, CE_CHORD_TYPE_BUTTON_HEIGHT)];
    self.majorChordTypeButton.fontSize = CE_MAIN_FONT_SIZE;
    [self.majorChordTypeButton setTitle:@"Major" forState:UIControlStateNormal];
    [self addSubview:self.majorChordTypeButton];
    
    self.minorChordTypeButton = [[CPRoundedRectButton alloc] initWithFrame:CGRectMake(chordTypesLabelFrame.origin.x, self.majorChordTypeButton.frame.origin.y + self.majorChordTypeButton.frame.size.height + CE_HEADER_BOTTOM_SPACING, CE_CHORD_TYPE_BUTTON_WIDTH, CE_CHORD_TYPE_BUTTON_HEIGHT)];
    self.minorChordTypeButton.fontSize = CE_MAIN_FONT_SIZE;
    [self.minorChordTypeButton setTitle:@"Minor" forState:UIControlStateNormal];
    [self addSubview:self.minorChordTypeButton];
    
    self.dominantChordTypeButton = [[CPRoundedRectButton alloc] initWithFrame:CGRectMake(chordTypesLabelFrame.origin.x, self.minorChordTypeButton.frame.origin.y + self.minorChordTypeButton.frame.size.height + CE_HEADER_BOTTOM_SPACING, CE_CHORD_TYPE_BUTTON_WIDTH, CE_CHORD_TYPE_BUTTON_HEIGHT)];
    self.dominantChordTypeButton.fontSize = CE_MAIN_FONT_SIZE;
    [self.dominantChordTypeButton setTitle:@"Dominant" forState:UIControlStateNormal];
    [self addSubview:self.dominantChordTypeButton];
    
    // dismiss button
    
    self.dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - CE_DISMISS_BUTTON_SIZE - CE_PADDING_LEFT_RIGHT, CE_DISMISS_BUTTON_TOP, CE_DISMISS_BUTTON_SIZE, CE_DISMISS_BUTTON_SIZE)];
    [self.dismissButton setBackgroundImage:[UIImage imageNamed:@"dismiss"] forState:UIControlStateNormal];
    [self addSubview:self.dismissButton];
  }
  return self;
}

@end
