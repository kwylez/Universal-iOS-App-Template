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

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
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

- (void)createAdBannerView {

  self.adBannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
  
  [self configureIAdContentSizes];

  self.adBannerView.frame    = CGRectOffset([self.adBannerView frame], 0, -[self getBannerHeight]);
  self.adBannerView.delegate = self;
  
  [self.view addSubview:self.adBannerView];
}

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {
  
  [super fixupAdView:toInterfaceOrientation];
  
  BOOL isPortrait = UIDeviceOrientationIsPortrait(toInterfaceOrientation);
  
  CGFloat minimumContentViewHeightForLandscape = 320;
  CGFloat minimumContentViewHeightForPortrait  = 480;
  CGFloat minimumContentViewHeight             = isPortrait ? minimumContentViewHeightForPortrait : minimumContentViewHeightForLandscape;
  
  if (self.adBannerView) {
    
    [self configureIAdContentSizes];
    
    [UIView animateWithDuration:0.75f animations:^{
    
      if (self.adBannerViewIsVisible) {
        
        CGRect adBannerViewFrame = self.adBannerView.frame;
        CGRect contentViewFrame  = self.tableView.frame;
        
        CGFloat adjustedContentViewHeight = (self.tableView.frame.size.height - [self getBannerHeight]);
        
        adBannerViewFrame.origin.x = 0;
        adBannerViewFrame.origin.y = 0;
        
        self.adBannerView.frame = adBannerViewFrame;
        
        contentViewFrame.origin.y    = [self getBannerHeight:toInterfaceOrientation];
        contentViewFrame.size.height = adjustedContentViewHeight < minimumContentViewHeight ? minimumContentViewHeight : adjustedContentViewHeight;
        contentViewFrame.size.height = [UIScreen mainScreen].bounds.size.height;
        
        self.tableView.frame = contentViewFrame;
        
      } else {
        
        CGRect adBannerViewFrame = self.adBannerView.frame;
        
        adBannerViewFrame.origin.x = 0;
        adBannerViewFrame.origin.y = -[self getBannerHeight:toInterfaceOrientation];
        
        self.adBannerView.frame = adBannerViewFrame;
        
        CGRect contentViewFrame = self.tableView.frame;
        
        contentViewFrame.origin.y    = 0;
        contentViewFrame.size.height = contentViewFrame.size.height < minimumContentViewHeight ? minimumContentViewHeight : contentViewFrame.size.height;
        
        self.tableView.frame = contentViewFrame;
      }
    }];
  }
}

@end
