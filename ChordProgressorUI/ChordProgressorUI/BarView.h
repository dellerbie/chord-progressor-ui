//
//  BarView.h
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/20/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChordButton.h"

@interface BarView : UIView

@property (nonatomic, strong) ChordButton *chordOneButton;
@property (nonatomic, strong) ChordButton *chordTwoButton;
@property (nonatomic, strong) ChordButton *chordThreeButton;
@property (nonatomic, strong) ChordButton *chordFourButton;

@end
