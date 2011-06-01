//
//  FirstViewController.m
//  UniversalExample
//
//  Created by Cory Wiles on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController

- (void)loadView {

  UIView *mainView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  mainView.backgroundColor = [UIColor whiteColor];
  
  self.view = mainView;
  
  [mainView release];
  
  UILabel *placeHolderLabel = [[UILabel alloc] initWithFrame:self.view.frame];

  placeHolderLabel.text          = @"Place Holder View Controller";
  placeHolderLabel.textAlignment = UITextAlignmentCenter;
  
  [self.view addSubview:placeHolderLabel];
  
  [placeHolderLabel release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

- (void)dealloc {
  [super dealloc];
}


@end
