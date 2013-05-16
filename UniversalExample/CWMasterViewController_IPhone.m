//
//  CWMasterViewController_IPhone.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWMasterViewController_IPhone.h"
#import "CWDetailViewController_IPhone.h"

@interface CWMasterViewController_IPhone ()

@end

@implementation CWMasterViewController_IPhone

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  CWDetailViewController_IPhone *detailViewController = [[CWDetailViewController_IPhone alloc] init];
  
  Model *model = [[Model alloc] init];
  
  if (indexPath.row == 0) {
    
    detailViewController.subcategories = model.firstDetail;
    
  } else {
    
    detailViewController.subcategories = model.secondDetail;
  }
  
  [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
