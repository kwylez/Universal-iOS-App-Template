//
//  SubDetailViewController_iPhone.m
//  UniversalExample
//
//  Created by Cory Wiles on 8/2/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "SubDetailViewController_iPhone.h"


@implementation SubDetailViewController_iPhone

- (void)viewDidLoad {
  
  CGRect tblFrame;

  /**
   *  Hard code values for frames are NOT recommended, but here for breavity sake
   */
  tblFrame = CGRectMake(0, 0, 320, 480);
  
  self.tblView.frame            = tblFrame;
  self.tblView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  [super viewDidLoad];
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
