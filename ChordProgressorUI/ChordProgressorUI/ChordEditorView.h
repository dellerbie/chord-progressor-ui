//
//  ChordEditorView.h
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/21/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChordButton.h"
#import "CPRoundedRectButton.h"

@interface ChordEditorView : UIView

@property (nonatomic, strong) UILabel *chordRootsLabel;
@property (nonatomic, strong) UILabel *chordTypesLabel;
@property (nonatomic, strong) ChordButton *chordButtonOne;
@property (nonatomic, strong) ChordButton *chordButtonTwo;
@property (nonatomic, strong) ChordButton *chordButtonThree;
@property (nonatomic, strong) ChordButton *chordButtonFour;
@property (nonatomic, strong) ChordButton *chordButtonFive;
@property (nonatomic, strong) ChordButton *chordButtonSix;
@property (nonatomic, strong) ChordButton *chordButtonSeven;
@property (nonatomic, strong) ChordButton *chordButtonEight;
@property (nonatomic, strong) ChordButton *chordButtonNine;
@property (nonatomic, strong) ChordButton *chordButtonTen;
@property (nonatomic, strong) ChordButton *chordButtonEleven;
@property (nonatomic, strong) CPRoundedRectButton *majorChordTypeButton;
@property (nonatomic, strong) CPRoundedRectButton *minorChordTypeButton;
@property (nonatomic, strong) CPRoundedRectButton *dominantChordTypeButton;
@property (nonatomic, strong) UIButton *dismissButton;

@end
