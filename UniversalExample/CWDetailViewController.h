//
//  CWDetailViewController.h
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface CWDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ADBannerViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *subcategories;
@property (nonatomic, strong) ADBannerView *adBannerView;
@property (nonatomic, assign) BOOL adBannerViewIsVisible;

- (void)createAdBannerView;
- (int)getBannerHeight:(UIInterfaceOrientation)orientation;
- (int)getBannerHeight;
- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation;
- (void)configureIAdContentSizes;

- (void)populateTable;

@end
