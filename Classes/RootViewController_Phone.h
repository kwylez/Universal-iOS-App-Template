//
//  RootViewController_Phone.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iAd/ADBannerView.h"
#import "RootViewController.h"
#import "DetailViewController_Phone.h"

@interface RootViewController_Phone : RootViewController <ADBannerViewDelegate> {

  id adBannerView;
  BOOL adBannerViewIsVisible;
}

@property (nonatomic, retain) id adBannerView;
@property (nonatomic) BOOL adBannerViewIsVisible;

- (void)createAdBannerView;
- (int)getBannerHeight:(UIDeviceOrientation)orientation;
- (int)getBannerHeight;
- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation;

@end
