//
//  CWMasterViewController.h
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import <iAd/iAd.h>

@class CWDetailViewController;

@interface CWMasterViewController : UIViewController <ADBannerViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ADBannerView *adBannerView;
@property (nonatomic, assign) BOOL adBannerViewIsVisible;

- (void)createAdBannerView;
- (int)getBannerHeight:(UIInterfaceOrientation)orientation;
- (int)getBannerHeight;
- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation;
- (void)configureIAdContentSizes;

@end
