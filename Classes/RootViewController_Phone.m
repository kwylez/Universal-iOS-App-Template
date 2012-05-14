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

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {
  
  [super fixupAdView:toInterfaceOrientation];
  
  BOOL isPortrait = UIDeviceOrientationIsPortrait(toInterfaceOrientation);
  
  CGFloat minimumContentViewHeightForLandscape = 320;
  CGFloat minimumContentViewHeightForPortrait  = 480;
  
  CGFloat minimumContentViewHeight = isPortrait ? minimumContentViewHeightForPortrait : minimumContentViewHeightForLandscape;
  
  if (adBannerView != nil) {
    
    [self configureIAdContentSizes];
    
    [UIView beginAnimations:@"fixupViews" context:nil];
    
    if (adBannerViewIsVisible) {
      
      TTDPRINT(@"banner should be visible");
      
      CGRect adBannerViewFrame = [adBannerView frame];
      CGRect contentViewFrame  = self.tblView.frame;
      
      CGFloat adjustedContentViewHeight = (self.tblView.frame.size.height - [self getBannerHeight]);
      
      adBannerViewFrame.origin.x = 0;
      adBannerViewFrame.origin.y = 0;
      
      [adBannerView setFrame:adBannerViewFrame];
      
      contentViewFrame.origin.y    = [self getBannerHeight:toInterfaceOrientation];
      contentViewFrame.size.height = adjustedContentViewHeight < minimumContentViewHeight ? minimumContentViewHeight : adjustedContentViewHeight;
      contentViewFrame.size.height = 480;
      self.tblView.frame = contentViewFrame;
      
    } else {
      
      CGRect adBannerViewFrame = [adBannerView frame];
      
      adBannerViewFrame.origin.x = 0;
      adBannerViewFrame.origin.y = -[self getBannerHeight:toInterfaceOrientation];
      
      [adBannerView setFrame:adBannerViewFrame];
      
      CGRect contentViewFrame = self.tblView.frame;
      
      contentViewFrame.origin.y    = 0;
      contentViewFrame.size.height = contentViewFrame.size.height < minimumContentViewHeight ? minimumContentViewHeight : contentViewFrame.size.height;
      
      self.tblView.frame = contentViewFrame;
    }
    
    [UIView commitAnimations];
  }   
}

@end
