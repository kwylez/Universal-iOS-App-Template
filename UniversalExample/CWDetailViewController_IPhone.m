//
//  CWDetailViewController_IPhone.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWDetailViewController_IPhone.h"
#import "CWSubDetailViewController_iPhone.h"

@interface CWDetailViewController_IPhone ()

@end

@implementation CWDetailViewController_IPhone

- (void)loadView {
  [super loadView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  CWSubDetailViewController_iPhone *subDetail = [[CWSubDetailViewController_iPhone alloc] init];
  
  [self.navigationController pushViewController:subDetail animated:YES];
}

@end
