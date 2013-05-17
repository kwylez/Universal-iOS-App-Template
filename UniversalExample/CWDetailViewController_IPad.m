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

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {
  
  [super fixupAdView:toInterfaceOrientation];
  
  BOOL isPortrait = UIDeviceOrientationIsPortrait(toInterfaceOrientation);
  
  CGFloat minimumContentViewHeightForLandscape = 768;
  CGFloat minimumContentViewHeightForPortrait  = 1024;
  
  CGFloat minimumContentViewHeight = isPortrait ? minimumContentViewHeightForPortrait : minimumContentViewHeightForLandscape;
  
  if (self.adBannerView) {
    
    [self configureIAdContentSizes];
    
    [UIView animateWithDuration:0.75f animations:^{
      
      if (self.adBannerViewIsVisible) {
        
        CGRect adBannerViewFrame          = self.adBannerView.frame;
        CGRect contentViewFrame           = self.tableView.frame;
        CGFloat adjustedContentViewHeight = (self.tableView.frame.size.height - [self getBannerHeight]);
        
        adBannerViewFrame.origin.x   = 0;
        adBannerViewFrame.origin.y   = 0;
        
        self.adBannerView.frame = adBannerViewFrame;
        
        contentViewFrame.origin.y    = adBannerViewFrame.origin.y + adBannerViewFrame.size.height;
        contentViewFrame.size.height = (adjustedContentViewHeight < minimumContentViewHeight) ?
        (minimumContentViewHeight - [self getBannerHeight]) : adjustedContentViewHeight;
        
        self.tableView.frame = contentViewFrame;
        
      } else {
        
        CGRect adBannerViewFrame = self.adBannerView.frame;
        
        adBannerViewFrame.origin.x = 0;
        adBannerViewFrame.origin.y = -[self getBannerHeight:toInterfaceOrientation];
        
        self.adBannerView.frame = adBannerViewFrame;
        
        CGRect contentViewFrame = self.tableView.frame;
        
        contentViewFrame.origin.y    = 0;
        contentViewFrame.size.height = self.tableView.frame.size.height;
        
        self.tableView.frame = contentViewFrame;
      }
    }];
  }
}

@end
