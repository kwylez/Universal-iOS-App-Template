//
//  FirstViewController.m
//  UniversalExample
//
//  Created by Cory Wiles on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CWFirstViewController.h"


@implementation CWFirstViewController

- (id)init {
  
  self = [super init];
  
  if (self) {
    self.title = @"First View Controller";
  }
  
  return self;
}

- (void)loadView {

  UIView *mainView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  mainView.backgroundColor = [UIColor whiteColor];
  
  self.view = mainView;
  
  UILabel *placeHolderLabel = [[UILabel alloc] initWithFrame:self.view.frame];

  placeHolderLabel.text          = @"Place Holder View Controller";
  placeHolderLabel.textAlignment = NSTextAlignmentCenter;
  
  placeHolderLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |
                                      UIViewAutoresizingFlexibleLeftMargin |
                                      UIViewAutoresizingFlexibleRightMargin |
                                      UIViewAutoresizingFlexibleTopMargin;
  
  [self.view addSubview:placeHolderLabel];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}


@end
