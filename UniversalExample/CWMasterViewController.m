//
//  CWMasterViewController.m
//  UniversalExample
//
//  Created by Cory D. Wiles on 5/13/13.
//  Copyright (c) 2013 Cory D. Wiles. All rights reserved.
//

#import "CWMasterViewController.h"

static NSString* const MASTER_CELL_IDENTIFIER = @"MASTER_CELL_IDENTIFIER";

@interface CWMasterViewController()

@end

@implementation CWMasterViewController

/**
 * Credit:  iAd integration methods were modified (slightly) from the AWESOME
 * tutorial from Ray Wenderlich
 * http://www.raywenderlich.com/1371/how-to-integrate-iad-into-your-iphone-app
 */

- (void)dealloc {

  _tableView.delegate   = nil;
  _tableView.dataSource = nil;
  
  _adBannerView.delegate = nil;
}

- (id)init {
  
  self = [super init];
  
  if (self) {
    self.title = NSLocalizedString(@"Master", @"Master");
  }
  
  return self;
}

- (void)loadView {
  
  UIView *mainView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];

  self.tableView = [[UITableView alloc] initWithFrame:mainView.frame style:UITableViewStylePlain];
  
  self.tableView.delegate         = self;
  self.tableView.dataSource       = self;
  self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  self.view = mainView;
  
  [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MASTER_CELL_IDENTIFIER];
  
  [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void)viewWillAppear:(BOOL)animated {

  [super viewWillAppear:animated];
  
  [self createAdBannerView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [self fixupAdView:toInterfaceOrientation];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MASTER_CELL_IDENTIFIER forIndexPath:indexPath];
  
  cell.textLabel.text = @"Root";
  cell.textLabel.text = (indexPath.row) == 0 ? @"First Detail" : @"Second Detail";
  
  return cell;
}

#pragma mark - iAd Custom Methods

- (int)getBannerHeight:(UIInterfaceOrientation)orientation {
  
  if (UIInterfaceOrientationIsLandscape(orientation)) {
    return kLandscapeIAdHeight;
  } else {
    return kPortraitIAdHeight;
  }
}

- (int)getBannerHeight {
  return [self getBannerHeight:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void)createAdBannerView {}

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {}

- (void)configureIAdContentSizes {
  self.adBannerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

#pragma mark - ADBannerViewDelegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
  
  if (!self.adBannerViewIsVisible) {
    
    self.adBannerViewIsVisible = YES;
    
    [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
  }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
  
  NSLog(@"ad failure: %@", error);
  
  if (self.adBannerViewIsVisible) {
    
    self.adBannerViewIsVisible = NO;
    
    [self fixupAdView:[[UIApplication sharedApplication] statusBarOrientation]];
  }
}

@end
