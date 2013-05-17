//
//  CWSubDetailViewController_iPhone.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/14/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWSubDetailViewController_iPhone.h"

@interface CWSubDetailViewController_iPhone ()

@end

@implementation CWSubDetailViewController_iPhone

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
