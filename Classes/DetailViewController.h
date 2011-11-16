//
//  DetailViewController.h
//  UniversalExample
//
//  Created by Cory Wiles on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iAd/ADBannerView.h"
#import "Model.h"

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ADBannerViewDelegate> {
  id adBannerView;
  BOOL adBannerViewIsVisible;
  UITableView *tblView;
  NSArray *subcategories;
}

@property (nonatomic, retain) id adBannerView;
@property (nonatomic) BOOL adBannerViewIsVisible;
@property (nonatomic, retain) UITableView *tblView;
@property (nonatomic, retain) NSArray *subcategories;

- (void)populateTable;
- (void)createAdBannerView;
- (int)getBannerHeight:(UIInterfaceOrientation)orientation;
- (int)getBannerHeight;
- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation;
- (void)configureIAdContentSizes;

@end
