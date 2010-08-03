//
//  RootViewController_Pad.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController_Pad.h"


@implementation RootViewController_Pad

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  UniversalExampleAppDelegate_Pad *delegate      = [[UIApplication sharedApplication] delegate];
  DetailViewController_Pad *detailViewController = (DetailViewController_Pad *)[delegate.splitViewController.viewControllers objectAtIndex:1];

  Model *model = [[Model alloc] init];
  
  if (indexPath.row == 0) {
    detailViewController.subcategories = model.firstDetail;
  } else {
    detailViewController.subcategories = model.secondDetail;
  }
  
  [model release];

  [detailViewController populateTable];
}

- (void)dealloc {
  [super dealloc];
}

@end
