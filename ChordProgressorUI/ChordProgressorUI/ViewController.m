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

#define HEIGHT(height) ceilf((height / 640.0) * 320.0)
#define WIDTH(width) ceilf((width / 1136.0) * 568.0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  CGSize screenSize = [[UIScreen mainScreen] bounds].size;
  NSLog(@"Screen width: %f, height: %f", screenSize.width, screenSize.height);
  
  BarView *barView = [[BarView alloc] initWithFrame:CGRectMake(60, 60, HEIGHT(360), WIDTH(145))];
  ChordButton *button = [[ChordButton alloc] initWithFrame:CGRectMake(50, 50, HEIGHT(78), HEIGHT(78))];
  [button setTitle:@"V" forState:UIControlStateNormal];
  
  [barView addSubview:button];
  [[self view] addSubview:barView];
  
  self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
}

@end
