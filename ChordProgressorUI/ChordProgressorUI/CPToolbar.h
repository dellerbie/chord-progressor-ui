//
//  CPToolbar.h
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/21/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPRoundedRectButton.h"

@interface CPToolbar : UIView

@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *rewindButton;
@property (nonatomic, strong) UIButton *fastForwardButton;
@property (nonatomic, strong) UIButton *restartButton;
@property (nonatomic, strong) UIButton *locateButton;
@property (nonatomic, strong) UILabel *barBeatInfoLabel;
@property (nonatomic, strong) UISlider *tempoSlider;
@property (nonatomic, strong) UILabel *bpmLabel;
@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) CPRoundedRectButton *keyButton;
@property (nonatomic, strong) CPRoundedRectButton *saveButton;
@property (nonatomic, strong) CPRoundedRectButton *loadButton;
@property (nonatomic, strong) CPRoundedRectButton *blankButton;
@property (nonatomic, strong) UIButton *infoButton;

@end
