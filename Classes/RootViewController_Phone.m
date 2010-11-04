//
//  RootViewController_Phone.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController_Phone.h"

@implementation RootViewController_Phone

- (void)loadView {
  [super loadView];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [self.tblView deselectRowAtIndexPath:indexPath animated:YES];
  
  DetailViewController_Phone *detail = [[DetailViewController_Phone alloc] init];
  Model *model                       = [[Model alloc] init];
  
  if (indexPath.row == 0) {
    detail.subcategories = model.firstDetail;
  } else {
    detail.subcategories = model.secondDetail;
  }

  [model release];

  [self.navigationController pushViewController:detail animated:YES];
  
  [detail release];
}

- (void)dealloc {
  [super dealloc];
}

@end
