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
  [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
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
