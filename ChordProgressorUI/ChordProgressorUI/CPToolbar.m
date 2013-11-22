//
//  CPToolbar.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/21/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "CPToolbar.h"

#define TOP_PADDING (6.0)
#define LEFT_RIGHT_PADDING (6.0)
#define PLAYBACK_CONTROL_SPACING (13.0)
#define BAR_BEAT_INFO_WIDTH (100.0)
#define BAR_BEAT_INFO_HEIGHT (20.0)

@implementation CPToolbar

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if(self)
  {
    self.backgroundColor = BLACK_COLOR;
    
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
    
    self.barBeatInfoLabel = [[UILabel alloc] init];
    //self.barBeatInfoLabel.center = CGPointMake((self.locateButton.frame.origin.x + self.locateButton.frame.size.width) / 2, 0);
    self.barBeatInfoLabel.text = @"Bar 1 Beat 1";
    self.barBeatInfoLabel.font = DEFAULT_FONT;
    self.barBeatInfoLabel.textColor = TOOLBAR_FONT_COLOR;
    
    [self addSubview:self.playButton];
    [self addSubview:self.rewindButton];
    [self addSubview:self.fastForwardButton];
    [self addSubview:self.restartButton];
    [self addSubview:self.locateButton];
    [self addSubview:self.barBeatInfoLabel];
  }
  return self;
}

@end
