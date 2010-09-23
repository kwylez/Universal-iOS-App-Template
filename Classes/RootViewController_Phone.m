//
//  RootViewController_Phone.m
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController_Phone.h"

@implementation RootViewController_Phone

/**
 * Credit:  iAd integration methods were modified (slightly) from the AWESOME 
 * tutorial from Ray Wenderlich
 * http://www.raywenderlich.com/1371/how-to-integrate-iad-into-your-iphone-app
 */

@synthesize adBannerView;
@synthesize adBannerViewIsVisible;

- (void)loadView {
  [super loadView];
}

- (void)viewDidLoad {
  [self createAdBannerView];
  [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {

  [self fixupAdView:[UIDevice currentDevice].orientation];
  
  [super viewWillAppear:animated];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [self fixupAdView:toInterfaceOrientation];
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
  
  self.adBannerView = nil;
  
  [super dealloc];
}

#pragma mark -
#pragma mark iAd Custom Methods

- (int)getBannerHeight:(UIDeviceOrientation)orientation {
  
  if (UIInterfaceOrientationIsLandscape(orientation)) {
    return 32;
  } else {
    return 50;
  }
}

- (int)getBannerHeight {
  return [self getBannerHeight:[UIDevice currentDevice].orientation];
}

- (void)createAdBannerView {
  
  Class classAdBannerView = NSClassFromString(@"ADBannerView");
  
  if (classAdBannerView != nil) {

    self.adBannerView = [[[classAdBannerView alloc] initWithFrame:CGRectZero] autorelease];
    
    [adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:ADBannerContentSizeIdentifier320x50, ADBannerContentSizeIdentifier480x32, nil]];
    
    if (UIInterfaceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier480x32];
    } else {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier320x50];            
    }
    
    [adBannerView setFrame:CGRectOffset([adBannerView frame], 0, -[self getBannerHeight])];
    
    [adBannerView setDelegate:self];
    
    [self.view addSubview:adBannerView];        
  }
}

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {

  if (adBannerView != nil) {        
    
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier480x32];
    } else {
      [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifier320x50];
    }
    
    [UIView beginAnimations:@"fixupViews" context:nil];
    
    if (adBannerViewIsVisible) {
      
      CGRect adBannerViewFrame = [adBannerView frame];

      adBannerViewFrame.origin.x = 0;
      adBannerViewFrame.origin.y = 0;
      
      [adBannerView setFrame:adBannerViewFrame];

      CGRect contentViewFrame = self.tblView.frame;

      contentViewFrame.origin.y    = [self getBannerHeight:toInterfaceOrientation];
      contentViewFrame.size.height = self.tblView.frame.size.height - [self getBannerHeight:toInterfaceOrientation];

      self.tblView.frame = contentViewFrame;

    } else {

      CGRect adBannerViewFrame = [adBannerView frame];
      
      adBannerViewFrame.origin.x = 0;
      adBannerViewFrame.origin.y = -[self getBannerHeight:toInterfaceOrientation];

      [adBannerView setFrame:adBannerViewFrame];
      
      CGRect contentViewFrame = self.tblView.frame;
      
      contentViewFrame.origin.y    = 0;
      contentViewFrame.size.height = self.tblView.frame.size.height;

      self.tblView.frame = contentViewFrame;            
    }
    
    [UIView commitAnimations];
  }   
}

#pragma mark -
#pragma mark ADBannerViewDelegate
- (void)bannerViewDidLoadAd:(ADBannerView *)banner {

  if (!adBannerViewIsVisible) {                

    adBannerViewIsVisible = YES;
    
    [self fixupAdView:[UIDevice currentDevice].orientation];
  }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {

  if (adBannerViewIsVisible) {        
    
    adBannerViewIsVisible = NO;
  
    [self fixupAdView:[UIDevice currentDevice].orientation];
  }
}

@end
