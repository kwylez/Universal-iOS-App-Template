//
//  DetailController_Phone.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController_Phone.h"


@implementation DetailViewController_Phone

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)dealloc {
  [super dealloc]; 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  SubDetailViewController_iPhone *subDetail = [[SubDetailViewController_iPhone alloc] init];
  
  [self.navigationController pushViewController:subDetail animated:YES];

  [subDetail release];
}

@end
