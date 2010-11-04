//
//  RootViewController.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "iAd/ADBannerView.h"

@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ADBannerViewDelegate> {
  UITableView *tblView;
  id adBannerView;
  BOOL adBannerViewIsVisible;
}

@property (nonatomic, retain) id adBannerView;
@property (nonatomic) BOOL adBannerViewIsVisible;
@property (nonatomic, retain) UITableView *tblView;

- (void)createAdBannerView;
- (int)getBannerHeight:(UIDeviceOrientation)orientation;
- (int)getBannerHeight;
- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation;

@end
