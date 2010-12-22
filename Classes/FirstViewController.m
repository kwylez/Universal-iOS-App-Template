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
  
  UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
  
  mainView.backgroundColor  = [UIColor redColor];
  mainView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  self.view = mainView;
  
  [mainView release];
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