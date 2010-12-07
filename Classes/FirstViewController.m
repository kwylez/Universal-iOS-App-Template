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
  
  mainView.backgroundColor = [UIColor redColor];
  
  self.view = mainView;
  
  [mainView release];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
}
*/


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
