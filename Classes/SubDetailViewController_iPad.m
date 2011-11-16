//
//  SubDetailViewController_iPad.m
//  UniversalExample
//
//  Created by Cory Wiles on 8/2/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "SubDetailViewController_iPad.h"


@implementation SubDetailViewController_iPad

- (void)viewDidLoad {

  CGRect tblFrame;

  /**
   *  Hard code values for frames are NOT recommended, but here for breavity sake
   */
  tblFrame = CGRectMake(0, 0, 320, 480);
  
  self.tblView.frame            = tblFrame;
  self.tblView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Dismiss" 
                                                                            style:UIBarButtonItemStyleBordered              
                                                                           target:self 
                                                                           action:@selector(dismissModalViewControllerAnimated:)] autorelease];

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
