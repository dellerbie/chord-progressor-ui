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
#import "ChordEditorView.h"

#define BAR_HEIGHT HEIGHT(145)
#define BAR_WIDTH WIDTH(360)
#define CHORD_EDITOR_HEIGHT HEIGHT(387)
#define CHORD_EDITOR_WIDTH WIDTH(387)

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  BarView *barView = [[BarView alloc] initWithFrame:CGRectMake(10, 15, BAR_WIDTH, BAR_HEIGHT)];
  [[self view] addSubview:barView];
  
  ChordEditorView *chordEditorView = [[ChordEditorView alloc] initWithFrame:CGRectMake(260, 15, CHORD_EDITOR_WIDTH, CHORD_EDITOR_HEIGHT)];
  [[self view] addSubview:chordEditorView];
  
  self.view.backgroundColor = BLACK_COLOR;
}

@end
