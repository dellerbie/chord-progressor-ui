//
//  ViewController.m
//  ChordProgressorUI
//
//  Created by Derrick Ellerbie on 11/20/13.
//  Copyright (c) 2013 dellerbie. All rights reserved.
//

#import "ViewController.h"
#import "BarView.h"
#import "ChordButton.h"

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  BarView *barView = [[BarView alloc] initWithFrame:CGRectMake(60, 60, HEIGHT(360), WIDTH(145))];
  [[self view] addSubview:barView];
  
  self.view.backgroundColor = BLACK_COLOR;
}

@end
