//
//  CWDetailViewController_IPad.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWDetailViewController_IPad.h"
#import "CWSubDetailViewController_iPad.h"

@interface CWDetailViewController_IPad ()

@property (nonatomic, strong) UIPopoverController *poViewController;

@end

@implementation CWDetailViewController_IPad

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  CWSubDetailViewController_iPad *subDetail = [[CWSubDetailViewController_iPad alloc] init];

  UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:subDetail];
  
  nav.modalPresentationStyle = UIModalPresentationPageSheet;
  
  [self.navigationController presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark - SplitView

- (void)splitViewController:(UISplitViewController*)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem
       forPopoverController: (UIPopoverController*)pc {
  
  barButtonItem.title = @"Main Bar Button Item";
  
  [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
  
  self.poViewController = pc;
}

- (void)splitViewController: (UISplitViewController*)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
  
  [self.navigationItem setLeftBarButtonItem:nil animated:YES];
  
  self.poViewController = nil;
}


@end
