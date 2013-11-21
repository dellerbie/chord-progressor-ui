//
//  ChordButton.h
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/20/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChordButton : UIButton

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) CGFloat strokeSize;
@property (nonatomic, assign) CGFloat fontSize;

- (id)initWithFrame:(CGRect)frame fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor strokeSize:(CGFloat) strokeSize fontSize:(CGFloat) fontSize;

@end
