//
//  CWSubDetailViewController_iPad.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/14/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWSubDetailViewController_iPad.h"

@interface CWSubDetailViewController_iPad ()

@end

@implementation CWSubDetailViewController_iPad

- (void)viewDidLoad {
  
  [super viewDidLoad];

  UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss"
                                                                style:UIBarButtonItemStyleBordered
                                                               target:self
                                                               action:@selector(dismissModalViewControllerAnimated:)];
  self.navigationItem.rightBarButtonItem = barButton;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
