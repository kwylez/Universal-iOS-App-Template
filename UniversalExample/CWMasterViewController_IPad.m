//
//  CWMasterViewController_IPad.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWMasterViewController_IPad.h"
#import "CWDetailViewController_IPad.h"
#import "CWAppDelegate_IPad.h"

@interface CWMasterViewController_IPad ()

@end

@implementation CWMasterViewController_IPad

- (id)init {
  
  self = [super init];
  
  if (self) {}
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  CWDetailViewController_IPad *detailViewController = self.detailViewController;
  
  Model *model = [[Model alloc] init];
  
  if (indexPath.row == 0) {
    
    detailViewController.subcategories = model.firstDetail;
    
  } else {
    
    detailViewController.subcategories = model.secondDetail;
  }
}

@end
