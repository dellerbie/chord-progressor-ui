//
//  CPToolbar.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/21/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "CPToolbar.h"
#import "TempoSlider.h"
#import "CPRoundedRectButton.h"

#define TOP_PADDING (6.0)
#define LEFT_RIGHT_PADDING (6.0)
#define PLAYBACK_CONTROL_SPACING (10.0)
#define COMPONENT_SPACING (20.0)
#define MIN_TEMPO (30.0)
#define MAX_TEMPO (230.0)
#define TEMPO_WIDTH (100.0)
#define TEMPO_HEIGHT (33.0)
#define TOOLBAR_FONT_SIZE DEFAULT_FONT_SIZE - 3
#define TOOLBAR_FONT [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:TOOLBAR_FONT_SIZE]
#define TOOLBAR_FONT_COLOR [UIColor colorWithRed:TO_RGB(178) green:TO_RGB(178) blue:TO_RGB(178) alpha:1.0]
#define SAVE_LOAD_NEW_BUTTON_WIDTH (44)
#define SAVE_LOAD_NEW_BUTTON_HEIGHT (22)
#define SAVE_LOAD_NEW_BUTTON_SPACING (PLAYBACK_CONTROL_SPACING/2)
#define KEY_BUTTON_SIZE (22)

@implementation CPToolbar

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self)
  {
    self.backgroundColor = BLACK_COLOR;
    
    NSDictionary *textAttributes = @{ NSFontAttributeName : TOOLBAR_FONT, NSForegroundColorAttributeName : TOOLBAR_FONT_COLOR };
    
    self.playButton = [[UIButton alloc] initWithFrame:CGRectMake(LEFT_RIGHT_PADDING, TOP_PADDING, WIDTH(29), HEIGHT(33))];
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"play-touch"] forState:UIControlStateHighlighted];
    
    self.rewindButton = [[UIButton alloc] initWithFrame:CGRectMake(self.playButton.frame.origin.x + self.playButton.frame.size.width + PLAYBACK_CONTROL_SPACING, TOP_PADDING, WIDTH(33), HEIGHT(33))];
    [self.rewindButton setBackgroundImage:[UIImage imageNamed:@"rewind"] forState:UIControlStateNormal];
    [self.rewindButton setBackgroundImage:[UIImage imageNamed:@"rewind-touch"] forState:UIControlStateHighlighted];
    
    self.fastForwardButton = [[UIButton alloc] initWithFrame:CGRectMake(self.rewindButton.frame.origin.x + self.rewindButton.frame.size.width + PLAYBACK_CONTROL_SPACING, TOP_PADDING, WIDTH(33), HEIGHT(33))];
    [self.fastForwardButton setBackgroundImage:[UIImage imageNamed:@"fast-forward"] forState:UIControlStateNormal];
    [self.fastForwardButton setBackgroundImage:[UIImage imageNamed:@"fast-forward-touch"] forState:UIControlStateHighlighted];
    
    self.restartButton = [[UIButton alloc] initWithFrame:CGRectMake(self.fastForwardButton.frame.origin.x + self.fastForwardButton.frame.size.width + PLAYBACK_CONTROL_SPACING, TOP_PADDING, WIDTH(48), HEIGHT(33))];
    [self.restartButton setBackgroundImage:[UIImage imageNamed:@"restart"] forState:UIControlStateNormal];
    [self.restartButton setBackgroundImage:[UIImage imageNamed:@"restart-touch"] forState:UIControlStateHighlighted];
    
    self.locateButton = [[UIButton alloc] initWithFrame:CGRectMake(self.restartButton.frame.origin.x + self.restartButton.frame.size.width + PLAYBACK_CONTROL_SPACING, TOP_PADDING, WIDTH(48), HEIGHT(30))];
    [self.locateButton setBackgroundImage:[UIImage imageNamed:@"locate"] forState:UIControlStateNormal];
    [self.locateButton setBackgroundImage:[UIImage imageNamed:@"locate-touch"] forState:UIControlStateHighlighted];
    
    self.barBeatInfoLabel = [UILabel new];
    NSString *barBeatInfoText = @"Bar 1 Beat 1";
    self.barBeatInfoLabel.text = barBeatInfoText;
    
    CGSize barBeatInfoLabelSize = [barBeatInfoText sizeWithAttributes:textAttributes];
    self.barBeatInfoLabel.frame = CGRectMake(0, 0, barBeatInfoLabelSize.width, barBeatInfoLabelSize.height);
    self.barBeatInfoLabel.center = CGPointMake((self.locateButton.frame.origin.x + self.locateButton.frame.size.width - LEFT_RIGHT_PADDING) / 2, TOP_PADDING + HEIGHT(33) + PLAYBACK_CONTROL_SPACING + 3.0);
    self.barBeatInfoLabel.font = TOOLBAR_FONT;
    self.barBeatInfoLabel.textColor = TOOLBAR_FONT_COLOR;
    
    self.tempoSlider = [UISlider new];
    [self.tempoSlider setMaximumValue:MAX_TEMPO];
    [self.tempoSlider setMinimumValue:MIN_TEMPO];
    [self.tempoSlider setContinuous:YES];
    [self.tempoSlider setThumbTintColor:STROKE_COLOR];
    [self.tempoSlider setMinimumTrackTintColor:RED_COLOR];
    [self.tempoSlider setMaximumTrackTintColor:STROKE_COLOR];
    self.tempoSlider.frame = CGRectMake(self.locateButton.frame.origin.x + self.locateButton.frame.size.width + COMPONENT_SPACING, 0, TEMPO_WIDTH, TEMPO_HEIGHT);
    
    self.bpmLabel = [UILabel new];
    self.bpmLabel.text = @"102.5 BPM";
    self.bpmLabel.font = TOOLBAR_FONT;
    self.bpmLabel.textColor = TOOLBAR_FONT_COLOR;
    self.bpmLabel.frame = CGRectMake(0, 0, self.barBeatInfoLabel.frame.size.width, self.barBeatInfoLabel.frame.size.height);
    CGFloat bpmLabelEndX = self.tempoSlider.frame.origin.x + self.tempoSlider.frame.size.width;
    self.bpmLabel.center = CGPointMake((bpmLabelEndX - self.tempoSlider.frame.size.width/2), TOP_PADDING + HEIGHT(33) + PLAYBACK_CONTROL_SPACING + 3.0);
    
    self.keyLabel = [UILabel new];
    NSString *keyText = @"Key";
    self.keyLabel.text = keyText;
    self.keyLabel.font = TOOLBAR_FONT;
    self.keyLabel.textColor = TOOLBAR_FONT_COLOR;
    CGSize keyLabelSize = [keyText sizeWithAttributes:textAttributes];
    self.keyLabel.frame = CGRectMake(self.tempoSlider.frame.origin.x + self.tempoSlider.frame.size.width + COMPONENT_SPACING, 2, keyLabelSize.width, keyLabelSize.height);
    
    self.keyButton = [[CPRoundedRectButton alloc] initWithFrame:CGRectMake(0, 0, KEY_BUTTON_SIZE, KEY_BUTTON_SIZE)];
    self.keyButton.fontSize = TOOLBAR_FONT_SIZE;
    [self.keyButton setTitle:@"Cb" forState:UIControlStateNormal];
    self.keyButton.center = self.keyLabel.center;
    self.keyButton.frame = CGRectMake(self.keyButton.frame.origin.x, self.keyButton.frame.origin.y + self.keyLabel.frame.size.height + 3, self.keyButton.frame.size.width, self.keyButton.frame.size.height);
    
    CGFloat saveLoadNewButtonsStartX = ((SAVE_LOAD_NEW_BUTTON_WIDTH + PLAYBACK_CONTROL_SPACING/2) * 3) + WIDTH(46) + PLAYBACK_CONTROL_SPACING;
    
    self.saveButton = [CPRoundedRectButton new];
    self.saveButton.fontSize = TOOLBAR_FONT_SIZE;
    [self.saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    self.saveButton.frame = CGRectMake(self.bounds.size.width - saveLoadNewButtonsStartX, self.bounds.size.height/2 - SAVE_LOAD_NEW_BUTTON_HEIGHT/2 , SAVE_LOAD_NEW_BUTTON_WIDTH, SAVE_LOAD_NEW_BUTTON_HEIGHT);
    
    self.blankButton = [CPRoundedRectButton new];
    self.blankButton.fontSize = TOOLBAR_FONT_SIZE;
    [self.blankButton setTitle:@"NEW" forState:UIControlStateNormal];
    self.blankButton.frame = CGRectMake(self.saveButton.frame.origin.x + self.saveButton.frame.size.width + SAVE_LOAD_NEW_BUTTON_SPACING, self.saveButton.frame.origin.y, SAVE_LOAD_NEW_BUTTON_WIDTH, SAVE_LOAD_NEW_BUTTON_HEIGHT);
    
    self.loadButton = [CPRoundedRectButton new];
    self.loadButton.fontSize = TOOLBAR_FONT_SIZE;
    [self.loadButton setTitle:@"LOAD" forState:UIControlStateNormal];
    self.loadButton.frame = CGRectMake(self.blankButton.frame.origin.x + self.blankButton.frame.size.width + SAVE_LOAD_NEW_BUTTON_SPACING, self.blankButton.frame.origin.y, SAVE_LOAD_NEW_BUTTON_WIDTH, SAVE_LOAD_NEW_BUTTON_HEIGHT);
    
    self.infoButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - WIDTH(46) - LEFT_RIGHT_PADDING, self.loadButton.frame.origin.y, WIDTH(46), HEIGHT(45))];
    [self.infoButton setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    [self.infoButton setBackgroundImage:[UIImage imageNamed:@"info-touch"] forState:UIControlStateHighlighted];
    
    [self addSubview:self.playButton];
    [self addSubview:self.rewindButton];
    [self addSubview:self.fastForwardButton];
    [self addSubview:self.restartButton];
    [self addSubview:self.locateButton];
    [self addSubview:self.barBeatInfoLabel];
    [self addSubview:self.tempoSlider];
    [self addSubview:self.bpmLabel];
    [self addSubview:self.keyLabel];
    [self addSubview:self.keyButton];
    [self addSubview:self.saveButton];
    [self addSubview:self.blankButton];
    [self addSubview:self.loadButton];
    [self addSubview:self.infoButton];
  }
  return self;
}

@end
